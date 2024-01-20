import express from 'express';
import {query} from "../service/MariaClient.js";
const router = express.Router();
import {vyberVsetkyPodujatia, vyberPodujatia, vyberPodujatiePodlaSortu} from "../service/Events.js";
import {pridajPodujatie} from "../service/Posts.js";
import {autorizacia} from "../service/Security.js";

let message = 0;
let autorizacie = false;
router.get("/", async function (req, res) {
    let eventy;

    if (autorizacie) {
        eventy = await vyberVsetkyPodujatia();
    } else {
        eventy = await vyberPodujatia();
    }
    console.debug(eventy)
    res.render('index/index.twig', {
        events: eventy,
        //pridat autentikaciu
        auth: autorizacie
    });
});

router.get("/admin", function (req, res) {
    res.render('index/admin.twig');
});


router.post("/admin/login", async function (req, res) {
    if (await autorizacia(req.body.pouzivatelskeMeno, req.body.heslo)) {
        autorizacie = true
        res.redirect("/");
    } else {
        res.redirect("/");
        autorizacie = false
    }
});
router.get("/admin/logout", function(req, res){
    autorizacie = false;
    res.redirect("/");
})

router.get("/pridajPodujatie", function (req, res){
    res.render("post/pridajPodujatie.twig");
});

router.get("/upravPodujatie/:ID", async function (req, res) {
    let eventy = await query("SELECT * FROM Eventy WHERE sprava_ID=" + req.params.ID);
    let datum = new Date(Date.parse(eventy[0].datumKonania));
    eventy[0].datumKonania = (datum.getMonth()+1) + "." + datum.getDate() + "." + datum.getFullYear();
    console.debug(eventy[0])
    res.render("post/upravPodujatie.twig",{
        event: eventy[0]
    });
});

router.post("/upravPodujatie/:ID", async function (req, res) {
    let opis = "UPDATE Eventy SET name='" + req.body.nazov + "'," +
        "nazov='" + req.body.opisPodujatia + "'," +
        "TypPodujatia='" + req.body.typPodujatia + "'," +
        "datumPodujatia='" + req.body.datumKonania + "'," +
        "miestoKonania='" + req.body.miestoKonania + "'," +
        "region='" + req.body.region + "'" +
        "WHERE sprava_ID=" + req.params.ID;
    console.debug(opis);
    await query(opis);
    res.redirect("/");
});

router.post("/posliPodujatie", async function(req, res){
    await pridajPodujatie(req.body); // req.body
    res.redirect("/");
});

router.get("/spravy/:Message_ID", async function (req, res) {
    let opisSpravy = "SELECT * FROM Message WHERE sprava_ID=" + req.params.Message_ID;
    message = req.params.Message_ID;
    let spravy = await query(opisSpravy);
    spravy.reverse();
    console.debug(spravy);

    res.render("index/spravy.twig", {
        messages: spravy,
        auth: autorizacie
    });
})

router.post("/spravy", async function(req, res){
    const data = req.body.textPole;
    let nove_spravy = "INSERT INTO Message(sprava, sprava_ID, prihlasovacie_meno) VALUES('" + req.body.textPole + "'," + message +", '" + req.body.textUser + "' )";
    let newMessage = await query(nove_spravy);
    res.redirect("/spravy/" + message);
})

router.post("/index/:ID", async function(req, res){
    let vymazanie = "DELETE FROM Eventy WHERE sprava_ID = " + req.params.ID;
    let vymazanie2 = "DELETE FROM Message WHERE sprava_ID = " + req.params.ID;
    await query(vymazanie);
    await query(vymazanie2);
    res.redirect("/");
});

router.post("/vymazPodujatie/:ID", async function(req, res){
   let databaza = "DELETE FROM Message WHERE Message_ID = " + req.params.ID;
   await query(databaza);
   res.redirect("/spravy/" + message);
});

router.get("/sort/:sortBy", async function (req, res) {
    const { sortBy } = req.params;
    let eventy;

    eventy = await vyberPodujatiePodlaSortu(sortBy);


    console.debug(eventy);
    res.render('index/index.twig', {
        events: eventy,
        auth: autorizacie
    });
});

export {router as IndexController}