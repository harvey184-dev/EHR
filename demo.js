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

        const sqlInsertBacSi = `INSERT INTO bacsi(ten, cccd, sdt, email, diachi, id_cn ) VALUES(?, ?, ?, ?, ?, ?)`;
        db.query(sqlInsertBacSi, [ten, gt, cccd, sdt, email, sobh, nmau, ngaysinh], (err, BacSiResults) => {
            if (err) {
                if (err.code === 'ER_DUP_ENTRY') {
                    db.query(`DELETE FROM login WHERE cccd = ? `, [cccd], () => {
                        return res.status(400).json({ message: 'CCCD đã tồn tại trong bảng bác sĩ' });
                    });
                } else {
                    db.query(`DELETE FROM login WHERE cccd = ? `, [cccd], () => {
                        return res.status(500).json({ message: 'Lỗi khi thêm vào bảng bác sĩ', error: err });
                    });
                }
            } else {
                return res.status(200).json({ message: 'Đăng ký thành công' });
            }
        });
    });
});