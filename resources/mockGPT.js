const express = require('express');
const app = express();
const port = 9999;

const words = ["time", "year", "people", "way", "day", "man", "thing", "woman", "life", "child", "world", "school", "state", "family", "student", "group", "country", "problem", "hand", "part", "place", "case", "week", "company", "system", "program", "question", "work", "government", "number", "night", "point", "home", "water", "room", "mother", "area", "money", "story", "fact", "month", "lot", "right", "study", "book", "eye", "job", "word", "business", "issue", "GPT", "side", "kind", "head", "house", "service", "friend", "father", "power", "hour", "game", "line", "end", "member", "law", "car", "city", "community", "name", "flutter", "president", "team", "minute", "idea", "kid", "body", "information", "back", "parent", "face", "others", "level", "office", "door", "health", "person", "art", "war", "history", "party", "result", "change", "morning", "reason", "research", "girl", "guy", "moment", "air", "teacher", "force", "education"];

app.use(express.json());

app.post('/api/chat', (req, res) => {
    res.setHeader('Content-Type', 'application/json');
    res.setHeader('Transfer-Encoding', 'chunked');

    const numWords = Math.floor(Math.random() * (25 - 5 + 1)) + 5;
    console.log(`numwords: ${numWords}`);

    let count = 0;
    const intervalId = setInterval(() => {
        if (count < numWords) {
            const word = words[Math.floor(Math.random() * words.length)];
            const response = JSON.stringify({
                message: {
                    content: word + ' '
                }
            });
            res.write(response);
            count++;
        } else {
            clearInterval(intervalId);
            res.end();
        }
    }, 250);
});

app.listen(port, '0.0.0.0', () => {
    console.log(`Server running at http://0.0.0.0:${port}`);
});
