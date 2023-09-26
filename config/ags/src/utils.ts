export const range = (startOrStop: number, stop?: number) => {
  const start = stop === undefined ? 0 : startOrStop
  const end = stop || startOrStop
  return [...Array(end - start)].map((_, i) => i + start)
}
