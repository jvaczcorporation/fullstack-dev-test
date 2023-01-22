import * as functions from "firebase-functions";
import * as  admin from 'firebase-admin';
import { CsvHandler } from "./csv-handler";

var credential = require('../smash-test-sdk-key.json');

admin.initializeApp({
    credential: admin.credential.cert(credential),
});

const firestore = admin.firestore();

type WorldCity = {
    name: string;
    country: string;
    subCountry: string;
    geoNameId: number;
};

function buildGroupedByCountry(data: Array<any>) {
    return data.reduce((accumulator, item) => {
        if (!accumulator[item.country]) {
            accumulator[item.country] = [];
        }
        accumulator[item.country].push(item)

        return accumulator;
    }, {});
}

export const insertDataWorldCities = functions.https.onRequest(async (request, response) => {
    const csvHandler = new CsvHandler();
    const data = await csvHandler.getDataFile();

    var groupedByCountry = buildGroupedByCountry(data);

    for (var country in groupedByCountry) {

        var listWorldCity: WorldCity[] = groupedByCountry[country]
        const docRefCountry = firestore.collection("countries").doc();

        docRefCountry.set({ name: country });

        for (var worldCity of listWorldCity) {
            const docRefCity = docRefCountry.collection("cities").doc();
            docRefCity.set(
                {
                    name: worldCity.name ?? '',
                    state: worldCity.subCountry ?? '',
                }
            );
        }
    }

    response.send("Cities of the world inserted!");
});


