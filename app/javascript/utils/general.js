export function formatDate(stringDate) {
    const date = new Date(stringDate);
    const month = date.toLocaleString('default', {month: 'short'})
    return `${date.getDay()} ${month} ${date.getFullYear()}`
}
