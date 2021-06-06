import axios from "axios";
import {routesBuilder} from "../routesBuilder";

async function loginRequest(credentials){
    const response = await axios.post(routesBuilder.api.auth.login.root, credentials, {
        headers: ''
    })
}