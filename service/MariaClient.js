import mysql from 'mysql2';


let pool = mysql.createPool({
    host: "127.0.0.1",
    user: "root",
    password: "admin",
    database: "databazaweb"
});

async function query(sql) {
    const promisePool = pool.promise();
    let [rows] = await promisePool.execute(sql);

    return rows;
}


export {query};