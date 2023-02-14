import { fetchAll } from "../../utils/db.js";


const GET = async () => {
    try {
        return await fetchAll(`
            select * from fan;
        `)
    } catch (error) {
        console.log(error.message);
    }
}

const POST = async ({fanId}) => {
    return await fetchAll(
        `
        select * from university natural join fakultet  where fan_id = $1
        `, [fanId]
    )
}

export default {
    GET,
    POST
}