import {fetch} from '../../utils/db.js'


const REGISTER = async ({full_name, email, username, password, gender}) => {
    try {
        return await fetch(
            `
                insert into users(full_name, email, username, password, gender) values($1, $2, $3, crypt($4, gen_salt('bf')), $5) returning full_name, email, username, gender
            `, [full_name, email, username, password, gender]
        )
    } catch (error) {
        console.log(error.message);
    }
}

const LOGIN = async ({username, password}) => {
    try {
        return await fetch(
            `
            select user_id, full_name, email, username, gender from users where username = $1 and password = crypt($2, password)
            `, [username, password]
        )
    } catch (error) {
        
    }
}

export default {
    REGISTER,
    LOGIN
}