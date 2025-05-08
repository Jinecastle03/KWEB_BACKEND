const fs = require('fs');
const util = require('util');
const path = require('path');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

const searchJS = async filedir => {
    try{
        const files = await readdir(filedir);
        for(const file of files){ //in보다는 of
            const full_path = path.join(filedir, file); //그냥 file로 하면 단순 파일명으로만 접근하기에 test/파일명 으로 접근할 수 있도록 함.
            const info = await stat(full_path);

            if(info.isDirectory()){
                await searchJS(full_path);
            }
            else{
                if(path.extname(file)=='.js'){
                    console.log(full_path);
                }
            }
        }
    }
    catch (err) {
        console.error(err);
    }
};

searchJS('test');
