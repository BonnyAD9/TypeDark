import "";

class FSItem {
    /** @type {Path} */
    path;
    /** @type {String} */
    type;
    /** @type {String | [String: FSItem] | function(Env): [Number]} */
    value;
    /** @type {Boolean} */
    exe = false;

    /**
     *
     * @param {String} name
     * @returns {FSItem | null}
     */
    createFile(name) {
        createFile(this, name);
    }

    /**
     *
     * @param {String} name
     * @returns {FSItem | null}
     */
    createDir(name) {
        createDir(this, name);
    }
}

function htmlText(s) {
    let lookup = {
        '&': "&amp;",
        '"': "&quot;",
        '\'': "&apos;",
        '<': "&lt;",
        '>': "&gt;"
    };
    return s.replace( /[&"'<>]/g, c => lookup[c] );
}

/**
 *
 * @param {FSItem} dir
 * @param {String} name
 * @returns {FSItem | null}
 */
function createFile(dir, name) {
    if (dir.type !== 'dir') {
        return null;
    }

    if (dir.value[name]) {
        return null;
    }

    dir.value[name] = {
        path: dir.path.join(new Path(name)),
        type: 'file',
        value: "",
    };
    return dir.value[name];
}
