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
                        return res.status(200).json({ message: 'Bạn là bác sĩ', role });
                    } else {
                        return res.status(200).json({ message: 'Bạn là bệnh nhân', role });
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




app.listen(port, () => {
    console.log(`Ứng dụng đã chạy với port ${port} `);
})