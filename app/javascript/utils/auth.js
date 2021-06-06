import axios from "axios";
import {routesBuilder} from "../routesBuilder";

async function loginRequest(credentials) {
    const response = await axios.post(routesBuilder.api.auth.login.root, credentials, {
        headers: ''
    })
}

export function setUser(loginResponse) {
    localStorage.setItem('userId', loginResponse.user_id)
    localStorage.setItem('token', loginResponse.token)
}

export function getUserId() {
    return +localStorage.getItem('userId')
}

export function authConfig() {
    return {headers: {Authentication: localStorage.getItem('token')}}
}