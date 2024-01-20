import * as Databaza from "./MariaClient.js";

async function  paciSaMi(postId) {
    // aktualizacia hodnoty v databaze
    await Databaza.query('UPDATE posts SET rating = rating + 1 WHERE id = :postId', {postId: postId});

    // nacitanie novej hodnoty
    let DatabazaVsetko = await Databaza.query('SELECT rating FROM posts WHERE id = :postId', {postId: postId});

    // vyber hodnoty z vysledku DB volania
    return DatabazaVsetko.pop().rating;
}

async function vymazPodujatie(postId) {
    await Databaza.query(
        'DELETE FROM posts WHERE id = :postId',
        {postId: postId}
    );
}

async function najdiVsetkyPodujatia() {
    return Databaza.query('SELECT s.*, u.pouzivatelske_meno FROM posts s LEFT JOIN Pouzivatel u ON s.userId = u.id ORDER BY s.created_at DESC');
}
async function pridajPodujatie(prispevok){
    prispevok.datumKonania = new Date(prispevok.datumKonania);
    prispevok.datumKonania = prispevok.datumKonania.getMonth()+1 + "-" + prispevok.datumKonania.getDate() +"-"+ prispevok.datumKonania.getFullYear();
    let eventy = "INSERT INTO Eventy(nazov, opisPodujatia, typPodujatia, datumKonania, miestoKonania, region) " +
        "VALUES('" + prispevok.nazov + "', '" + prispevok.opisPodujatia + "', '" + prispevok.typPodujatia +
        "', STR_TO_DATE('" + prispevok.datumKonania + "', '%m-%d-%Y') , '" + prispevok.miestoKonania + "', '" + prispevok.region + "')";
    console.debug(eventy)
    return Databaza.query(eventy);
}



export {paciSaMi, pridajPodujatie, najdiVsetkyPodujatia, vymazPodujatie};