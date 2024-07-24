const express = require('express');
const app = express();
const port = 9999;

// List of dictionaries containing words and their singularity
const words = [
  ["rose", "plural"], ["food", "singular"], ["cat", "singular"], ["dogs", "plural"],
  ["book", "singular"], ["trees", "plural"], ["car", "singular"], ["birds", "plural"],
  ["house", "singular"], ["clouds", "plural"], ["computer", "singular"], ["phones", "plural"],
  ["child", "singular"], ["stars", "plural"], ["movie", "singular"], ["songs", "plural"],
  ["chair", "singular"], ["flowers", "plural"], ["pencil", "singular"], ["mountains", "plural"],
  ["river", "singular"], ["oceans", "plural"], ["student", "singular"], ["teachers", "plural"],
  ["city", "singular"], ["countries", "plural"], ["friend", "singular"], ["enemies", "plural"],
  ["game", "singular"], ["stories", "plural"], ["idea", "singular"], ["thoughts", "plural"],
  ["apple", "singular"], ["bananas", "plural"], ["coffee", "singular"], ["teas", "plural"],
  ["phone", "singular"], ["computers", "plural"], ["day", "singular"], ["nights", "plural"],
  ["sun", "singular"], ["moons", "plural"], ["person", "singular"], ["people", "plural"],
  ["animal", "singular"], ["plants", "plural"], ["building", "singular"], ["streets", "plural"],
  ["movie", "singular"], ["books", "plural"]
].map(([word, singularity]) => ({ word, singularity }));

// List of adjectives
const adjectives = [
  "beautiful", "good", "happy", "sad", "big", "small", "fast", "slow", "bright",
  "dark", "loud", "quiet", "hot", "cold", "soft", "hard", "smooth", "rough", "sweet", "sour"
];

app.use(express.json());

app.post('/api/chat', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.setHeader('Transfer-Encoding', 'chunked');

  const numSentences = Math.floor(Math.random() * 5) + 1;

  const generateSentences = async () => {
    await new Promise(resolve => setTimeout(resolve, 2000));

    for (let i = 0; i < numSentences; i++) {
      const wordDict = words[Math.floor(Math.random() * words.length)];
      const { word, singularity } = wordDict;
      const adjective = adjectives[Math.floor(Math.random() * adjectives.length)];

      const verb = singularity === "singular" ? "is" : "are";

      const sentence = `${word.charAt(0).toUpperCase() + word.slice(1)} ${verb} ${adjective}. `;

      const responseJson = JSON.stringify({
        message: {
          content: sentence
        }
      });

      res.write(responseJson + '\n');

      await new Promise(resolve => setTimeout(resolve, 500));
    }

    res.end();
  };

  generateSentences();
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server running at http://0.0.0.0:${port}`);
});
