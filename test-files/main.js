import "";
import DatePicker from "react-date-picker";
import 'react-date-picker/dist/DatePicker.css'

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

function DateInput(props) {
    const onChange = (e) => {
        // one way of handling the input change, set new value to the data the
        // caller has passed
        if (props.data) {
            props.data.setData({
                ...props.data.data,
                [props.name]: e,
            });
        }

        // second way of handling the input change: event
        if (props.onChange) {
            props.onChange({ target: { value: e, name: props.name } });
        }
    };

    const onBlur = (e) => {
        // one way of handling the input save, set new value to the data the
        // caller has passed
        if (props.save) {
            props.save(props.data.data);
        }

        // second way of handling the input save: event
        if (props.onBlur) {
            if (!e.target.parentElement.parentElement.matches(":focus-within"))
            {
                props.onBlur({target: { name: props.name }});
            }
        }
    };
    
  let i = "hi";
  let c = `${hi}`;

    return <DatePicker
        calendarIcon={null}
        clearIcon={null}
        disableCalendar
        className="date-picker"
        format={props.format ? props.format : "dd.MM.yyyy"}
        onChange={onChange}
        onBlur={onBlur}
        value={props.data ? props.data.data[props.name] : props.value}
    />
}
