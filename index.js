var express = require('express');
var db = require('./connect_mysql');
const port = 3000;
var app = express();

const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

app.get('/', (req, res) => {
    res.json("{'message':'API NodeJs Assignment'}");
})

// Đăng nhập
app.post('/login', (req, res) => {
    const { cccd, pass } = req.body;

    if (!cccd || !pass) {
        return res.status(400).json({ message: 'Vui lòng nhập CCCD và mật khẩu' });
    }

    const sqlLogin = `SELECT id FROM Login WHERE cccd = ? AND pass = ?`;
    db.query(sqlLogin, [cccd, pass], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi truy vấn cơ sở dữ liệu' });
        }

        if (results.length > 0) {
            const user = results[0];
            const id = user.id;

            const sqlRole = `SELECT role FROM Login WHERE id = ?`;
            db.query(sqlRole, [id], (err, roleResults) => {
                if (err) {
                    return res.status(500).json({ message: 'Lỗi khi truy vấn cơ sở dữ liệu 2', id });
                }

                if (roleResults.length > 0) {
                    const role = roleResults[0].role;
                    if (role === 0) {
                        const sqlDoctor = `SELECT * FROM bacsi WHERE cccd = ?`
                        db.query(sqlDoctor, [cccd], (err, doctorResults) => {
                            if (err) {
                                return res.status(500).json({ message: 'Lỗi truy xuất dữ liệu' });
                            }
                            return res.json(doctorResults);
                        })
                    } else {
                        const sqlBN = `SELECT * FROM benhnhan WHERE cccd = ?`
                        db.query(sqlBN, [cccd], (err, BnResults) => {
                            if (err) {
                                return res.status(500).json({ message: 'Lỗi truy xuất dữ liệu' });
                            }
                            return res.json(BnResults);
                        })
                    }
                } else {
                    return res.status(401).json({ message: 'Không tìm thấy vai trò cho người dùng' });
                }
            });
        } else {
            return res.status(401).json({ message: 'Sai CCCD hoặc mật khẩu' });
        }
    });
});

// Tạo tài khoản bệnh nhân
app.post('/register', (req, res) => {
    const { ten, gt, cccd, sdt, email, sobh, nmau, ngaysinh, pass } = req.body;

    if (!cccd || !pass || !ten || !sdt || !sobh) {
        return res.status(400).json({ message: 'Vui lòng điền đầy đủ thông tin bắt buộc' });
    }

    const sqlInsertLogin = `INSERT INTO login (cccd, pass, role) VALUES(?, ?, 1)`;
    db.query(sqlInsertLogin, [cccd, pass], (err, loginResults) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi thêm vào bảng login', error: err });
        }

        const sqlInsertBenhNhan = `INSERT INTO benhnhan(ten, gt, cccd, sdt, email, sobh, nmau, ngaysinh) VALUES(?, ?, ?, ?, ?, ?, ?, ?)`;
        db.query(sqlInsertBenhNhan, [ten, gt, cccd, sdt, email, sobh, nmau, ngaysinh], (err, benhnhanResults) => {
            if (err) {
                if (err.code === 'ER_DUP_ENTRY') {
                    db.query(`DELETE FROM login WHERE cccd = ? `, [cccd], () => {
                        return res.status(400).json({ message: 'CCCD đã tồn tại trong bảng benhnhan' });
                    });
                } else {
                    db.query(`DELETE FROM login WHERE cccd = ? `, [cccd], () => {
                        return res.status(500).json({ message: 'Lỗi khi thêm vào bảng benhnhan', error: err });
                    });
                }
            } else {
                return res.status(200).json({ message: 'Đăng ký thành công' });
            }
        });
    });
});

// Đăng ký bác sĩ
app.post('/registerBacsi', (req, res) => {
    const { ten, cccd, diachi, sdt, email, id_cn, pass } = req.body;

    if (!cccd || !pass || !ten || !sdt || !diachi || !id_cn) {
        return res.status(400).json({ message: 'Vui lòng điền đầy đủ thông tin bắt buộc' });
    }

    const sqlInsertLogin = `INSERT INTO login (cccd, pass, role) VALUES(?, ?, 0)`;
    db.query(sqlInsertLogin, [cccd, pass], (err, loginResults) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi thêm vào bảng login', error: err });
        }

        const sqlInsertBacSi = `INSERT INTO bacsi (ten, id_cn, diachi, email, sdt, cccd) VALUES (?, ?, ?, ?, ?, ?)`;
        db.query(sqlInsertBacSi, [ten, id_cn, diachi, email, sdt, cccd], (err, BacSiResults) => {
            if (err) {
                const deleteLoginQuery = `DELETE FROM login WHERE cccd = ?`;
                db.query(deleteLoginQuery, [cccd], () => {
                    if (err.code === 'ER_DUP_ENTRY') {
                        return res.status(400).json({ message: 'CCCD đã tồn tại trong bảng bác sĩ' });
                    } else {
                        return res.status(500).json({ message: 'Lỗi khi thêm vào bảng bác sĩ', error: err });
                    }
                });
            } else {
                return res.status(200).json({ message: 'Đăng ký thành công' });
            }
        });
    });
});

// Thêm bệnh án
app.post('/add-medical-records', (req, res) => {
    let { id_bs, id_bn, ngay, chuandoan, kqxn = [], xquang = [], donthuoc = [] } = req.body

    if (!id_bs || !id_bn || !ngay || !chuandoan) {
        return res.status(400).json({ error: "Vui lòng nhập đủ thông tin bác sĩ, bệnh nhân, ngày, chuấn đoán" });
    }
    const sql = `INSERT INTO benhan (id_bs, id_bn, ngay, chuandoan) VALUES(?, ?, ?, ?)`
    db.query(sql, [id_bs, id_bn, ngay, chuandoan], (err, result) => {
        if (err) {
            return res.status(200).json({ message: 'Thêm bệnh án thất bại', error: err.message });
        }

        const benhanID = result.insertId;

        const sqlKqxn = 'INSERT INTO kqxn (id_ba, ten, mota) VALUES (?, ?, ?)';
        kqxn.forEach(item => {
            db.query(sqlKqxn, [benhanID, item.ten, item.mota || null], (err) => {
                if (err) {
                    return res.status(500).json({ message: 'Thêm xét nghiệm thất bại' });
                }
            });
        });

        const sqlXquang = 'INSERT INTO xquang (id_ba, ten, mota) VALUES (?, ?, ?)';
        xquang.forEach(item => {
            db.query(sqlXquang, [benhanID, item.ten, item.mota || null], (err) => {
                if (err) {
                    return res.status(500).json({ message: 'Thêm X-quang thất bại' });
                }
            });
        });

        const sqldonthuoc = 'INSERT INTO donthuoc (id_ba, ten, dvt, sl, hdsd) VALUES (?, ?, ?, ?, ?)';
        donthuoc.forEach(item => {
            db.query(sqldonthuoc, [benhanID, item.ten, item.dvt || null, item.sl || null, item.hdsd || null], (err) => {
                if (err) {
                    return res.status(500).json({ message: 'Thêm đơn thuốc thất bại' });
                }
            });
        });

        res.status(201).json({ message: 'Thêm bệnh án thành công', id: benhanID });

    })
})

// Tất cả bệnh án của bệnh nhân
app.get('/all-medical-records/:id', function (req, res) {
    let id = req.params.id
    sql = `SELECT * FROM benhan WHERE id_bn = ${id} `
    db.query(sql, function (err, data) {
        if (err) res.json({ message: `Lỗi: ${err} ` })
        else res.json(data)
    })
})

// Chi tiết bệnh án
app.get('/medical-records/:id', function (req, res) {

    let id = req.params.id

    sql = `SELECT * FROM benhan WHERE id = ${id} `
    db.query(sql, function (err, result) {
        if (err) {
            return res.status(500).json({ message: 'Lỗi truy vấn bệnh án', error: err.message });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: 'Bệnh án không tồn tại' });
        }

        const benhan = result[0];

        const sqlKqxn = `SELECT ten, mota FROM kqxn WHERE id_ba = ?`;
        db.query(sqlKqxn, [id], (err, kqxnResults) => {
            if (err) {
                return res.status(500).json({ message: 'Lỗi truy vấn kết quả xét nghiệm', error: err.message });
            }

            const sqlXquang = `SELECT ten, mota FROM xquang WHERE id_ba = ?`;
            db.query(sqlXquang, [id], (err, xquangResults) => {
                if (err) {
                    return res.status(500).json({ message: 'Lỗi truy vấn X-quang', error: err.message });
                }

                const sqlDonthuoc = `SELECT ten, dvt, sl, hdsd FROM donthuoc WHERE id_ba = ?`;
                db.query(sqlDonthuoc, [id], (err, donthuocResults) => {
                    if (err) {
                        return res.status(500).json({ message: 'Lỗi truy vấn đơn thuốc', error: err.message });
                    }

                    res.status(200).json({
                        benhan: benhan,
                        kqxn: kqxnResults,
                        xquang: xquangResults,
                        donthuoc: donthuocResults
                    })
                });
            });
        })
    })
})

// Các bệnh án mà 1 bác sĩ đã phê cho 1 bệnh nhân
app.get('/doctor-medical-records/:idBs/:idBn', function (req, res) {
    let id_Bs = req.params.idBs
    let id_Bn = req.params.idBn
    sql = `SELECT * FROM benhan WHERE id_Bs = ${id_Bs} AND id_Bn = ${id_Bn} `
    db.query(sql, function (err, data) {
        if (err) res.json({ message: `Lỗi: ${err} ` })
        else res.json(data)
    })
})

// Xóa Bác sĩ
app.delete('/deleteBS/:cccd', function (req, res) {
    let cccd = req.params.cccd
    let sql = `DELETE FROM bacsi WHERE cccd = ?`
    db.query(sql, [cccd], function (err, data) {
        if (err) res.json({ message: `Lỗi: ${err} ` })
        else {
            let sql1 = `DELETE FROM bacsi WHERE cccd = ?`
            db.query(sql1, [cccd], function (err, data) {
                if (err) res.json({ message: `Lỗi: ${err} ` })
                else res.json({ message: `xóa thành công` })
            })
        }
    })
})

// Thay đổi thông tin bệnh nhân
app.put('/edit-information/:id', function (req, res) {
    let id = req.params.id
    const { ten, gt, cccd, sdt, email, sobh, nmau, ngaysinh } = req.body;

    if (!ten || !cccd || !sdt) {
        return res.status(400).json({ error: "Vui lòng cung cấp đủ thông tin tên, CCCD và số điện thoại." });
    }

    const sqlUpdate = `
        UPDATE benhnhan
        SET ten = ?, gt = ?, sdt = ?, email = ?, sobh = ?, nmau = ?, ngaysinh = ?
        WHERE id = ? AND cccd = ?
    `;
    db.query(sqlUpdate, [ten, gt || null, sdt, email || null, sobh, nmau || null, ngaysinh || null, id, cccd], (err, result) => {
        if (err) {
            return res.status(500).json({ message: 'Cập nhật thông tin bệnh nhân thất bại', error: err.message });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Bệnh nhân không tồn tại hoặc CCCD không chính xác' });
        }

        res.status(200).json({ message: 'Cập nhật thông tin bệnh nhân thành công' });
    });

})

app.listen(port, () => {
    console.log(`Ứng dụng đã chạy với port ${port} `);
})