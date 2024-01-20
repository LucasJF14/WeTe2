import {query} from "./MariaClient.js";


async function autorizacia(pouzivatelskeMeno, heslo) {
    let admin = await query("SELECT pouzivatelske_meno, heslo FROM Pouzivatel WHERE id= 14");
    return admin[0].pouzivatelske_meno === pouzivatelskeMeno && admin[0].heslo === heslo;
}

export {autorizacia};