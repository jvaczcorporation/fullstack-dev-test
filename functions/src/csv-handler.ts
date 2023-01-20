import * as fs from "fs";
import * as path from "path";
import { parse } from 'csv-parse';

export class CsvHandler {

    async getDataFile(): Promise<Array<any>> {
        const csvFilePath = path.resolve(__dirname, '../data/world-cities.csv');
        const headers = ['name', 'country', 'subCountry', 'geoNameId'];
        const fileContent = fs.readFileSync(csvFilePath, { encoding: 'utf-8' });

        const worldCities: Array<any> = await new Promise((resolve, reject) => {
            parse(fileContent, {
                delimiter: ',',
                columns: headers,
            }, async (error: any, result: any) => {
                if (error) {
                    console.error(error);
                }
                result.shift();
                resolve(result)
            });
        });

        return worldCities;
    }
}