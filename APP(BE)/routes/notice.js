const express = require('express');
const app = express();
const router = express.Router();
const cookieParser = require('cookie-parser');
const {verifyToken} = require(__dirname + '/../middlewares/authorization.js');
const db_config = require(__dirname + '/../config/database.js');
const conn = db_config.init();
db_config.connect(conn);
app.use(cookieParser());

//공지사항 작성하는 라우터
router.post('/', async function(req, res) {
	const insertSuggestionQuery = `INSERT INTO notice(troop_id, title, content) VALUES(?, ?, ?);`;
	conn.query(insertSuggestionQuery, [req.body.troopId, req.body.title, req.body.content], async function(err, result, fields){
		if (err) {
			console.log(err);
		}
		else {
			res.send({message: 'notice inserted'});
		}
	});
});

//부대의 공지사항 조회하는 라우터 
router.get('/:troopId', async function(req, res){
	const getSuggestionQuery = `SELECT * FROM notice WHERE troop_id = ? ORDER BY created_at DESC;`;
	conn.query(getSuggestionQuery, [req.params.troopId], async function(err, suggestions, field){
		if(err) {
			console.log(err);
		}
		res.send(suggestions);
	});
});

module.exports = router;
