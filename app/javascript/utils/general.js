export function formatDate(stringDate) {
    const date = new Date(stringDate);
    const month = date.toLocaleString('default', {month: 'short'})
    return `${date.getDay()} ${month} ${date.getFullYear()}`
}

export function arrayRemove(array, func) {
    let index;

    if (typeof func === 'function') {
        index = array.findIndex(func)
    } else if (typeof x === 'number') {
        index = func
    }

    if (index > -1) {
        array.splice(index, 1)
    }
}
