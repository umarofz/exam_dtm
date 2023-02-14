import {fetchAll} from '../../utils/db.js'

const POST = async ({universityId}) => {
    try {
        return await fetchAll(`
        select * from fakultet natural join university where university_id = $1
        `, [universityId])
    } catch (error) {
        console.log(error.message);
    }
}

export default {
    POST
}