
func levenshtein_distance(word1: String, word2: String) -> Int {
    let (word1, word2) = (word1.map(Character.init), word2.map(Character.init))
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
    table[0][0] = 0
    
    for i in table.indices where i > 0 {
        table[i][0] = table[i - 1][0] + 1
    }
    
    for i in table[0].indices where i > 0 {
        table[0][i] = table[0][i - 1] + 1
    }
    
    for row in table.indices where row > 0 {
        for col in table[0].indices where col > 0 {
            if word1[row - 1] == word2[col - 1] {
                table[row][col] = table[row - 1][col - 1]
            } else {
                table[row][col] = min(table[row][col - 1], table[row - 1][col], table[row - 1][col - 1]) + 1
            }
        }
    }
    
    return table[table.count - 1][table[0].count - 1]
}
