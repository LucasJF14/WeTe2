import {query} from "./MariaClient.js";

async function vyberPodujatia(){
    return query("SELECT nazov, opisPodujatia, typPodujatia, TO_CHAR(datumKonania, 'YYYY-MM-DD') as datumKonania, miestoKonania, region, sprava_ID FROM Eventy WHERE datumKonania >= now()");
}
async function vyberVsetkyPodujatia(){
    return query("SELECT nazov, opisPodujatia, typPodujatia, TO_CHAR(datumKonania, 'YYYY-MM-DD') as datumKonania, miestoKonania, region, sprava_ID FROM Eventy")
}

async function vyberPodujatiePodlaSortu(sortBy) {
    let sqlQuery;

    switch (sortBy) {
        case "name":
            sqlQuery = "SELECT nazov, opisPodujatia, typPodujatia, TO_CHAR(datumKonania, 'YYYY-MM-DD') as datumKonania, miestoKonania, region, sprava_ID FROM Eventy WHERE datumKonania >= now() ORDER BY nazov";
            break;
        case "date":
            sqlQuery = "SELECT nazov, opisPodujatia, typPodujatia, TO_CHAR(datumKonania, 'YYYY-MM-DD') as datumKonania, miestoKonania, region, sprava_ID FROM Eventy WHERE datumKonania >= now() ORDER BY datumKonania";
            break;
        case "region":
            sqlQuery = "SELECT nazov, opisPodujatia, typPodujatia, TO_CHAR(datumKonania, 'YYYY-MM-DD') as datumKonania, miestoKonania, region, sprava_ID FROM Eventy WHERE datumKonania >= now() ORDER BY region";
            break;
        default:
            sqlQuery = "SELECT nazov, opisPodujatia, typPodujatia, TO_CHAR(datumKonania, 'YYYY-MM-DD') as datumKonania, miestoKonania, region, sprava_ID FROM Eventy WHERE datumKonania >= now()";
    }

    return query(sqlQuery);
}

export {vyberPodujatia, vyberVsetkyPodujatia, vyberPodujatiePodlaSortu};