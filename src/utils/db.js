import pg from 'pg'


const pool = new pg.Pool({
    user: 'umaroffz_',
    database: 'exam_dtm',
    password: 'Apple@8800',
    host: 'localhost'
})

async function fetchAll(SQL, params=[]) {
    const client = await pool.connect();
    try {
        const {rows} = await client.query(SQL, params);
        return rows
    } catch (error) {
        console.log('db error: ', error.message);
    }finally{
        client.release()
    }
}


async function fetch(SQL, params=[]) {
    const client = await pool.connect();
    try {
        const {rows: [row]} = await client.query(SQL, params);
        return row
    } catch (error) {
        console.log('db error: ', error.message);
    }finally{
        client.release()
    }
}

export {
    fetch,
    fetchAll
}