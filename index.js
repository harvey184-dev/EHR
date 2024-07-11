const exp = require('express')
const app = exp()
const port = 3000
var db = require('./connect_mysql')

var cors = require('cors')
app.use(cors())

const bodyParser = require('body-parser');
app.use(bodyParser.json());


app.use(exp.json());

app.get('/', (req, res) => {
    res.json("{'message':'API NodeJs Assignment'}");
})

app.post('/login', (req, res) => {
    const { cccd, pass } = req.body;

    if (!cccd || !pass) {
        return res.status(400).json({ message: 'Vui lòng nhập CCCD và mật khẩu' });
    }

    const sql = `SELECT * FROM Login WHERE cccd = ? AND pass = ?`;
    db.query(sql, [cccd, pass], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi truy vấn cơ sở dữ liệu' });
        }

        if (results.length > 0) {
            const user = results[0];
            return res.status(200).json({ message: 'Đăng nhập thành công', user });
        } else {
            return res.status(401).json({ message: 'Sai CCCD hoặc mật khẩu' });
        }
    });
});

app.listen(port, () => {
    console.log(`Ứng dụng đã chạy với port ${port}`);
})