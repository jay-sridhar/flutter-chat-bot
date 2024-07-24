from flask import Flask, Response, jsonify
import random
import time
import json

app = Flask(__name__)

# List of dictionaries containing words and their singularity (in a single line)
words = [{"word": w, "singularity": s} for w, s in [("rose", "plural"), ("food", "singular"), ("cat", "singular"), ("dogs", "plural"), ("book", "singular"), ("trees", "plural"), ("car", "singular"), ("birds", "plural"), ("house", "singular"), ("clouds", "plural"), ("computer", "singular"), ("phones", "plural"), ("child", "singular"), ("stars", "plural"), ("movie", "singular"), ("songs", "plural"), ("chair", "singular"), ("flowers", "plural"), ("pencil", "singular"), ("mountains", "plural"), ("river", "singular"), ("oceans", "plural"), ("student", "singular"), ("teachers", "plural"), ("city", "singular"), ("countries", "plural"), ("friend", "singular"), ("enemies", "plural"), ("game", "singular"), ("stories", "plural"), ("idea", "singular"), ("thoughts", "plural"), ("apple", "singular"), ("bananas", "plural"), ("coffee", "singular"), ("teas", "plural"), ("phone", "singular"), ("computers", "plural"), ("day", "singular"), ("nights", "plural"), ("sun", "singular"), ("moons", "plural"), ("person", "singular"), ("people", "plural"), ("animal", "singular"), ("plants", "plural"), ("building", "singular"), ("streets", "plural"), ("movie", "singular"), ("books", "plural")]]

# List of adjectives (in a single line)
adjectives = ["beautiful", "good", "happy", "sad", "big", "small", "fast", "slow", "bright", "dark", "loud", "quiet", "hot", "cold", "soft", "hard", "smooth", "rough", "sweet", "sour"]

@app.route('/api/chat', methods=['POST'])
def generate_sentence():
    def generate():
        num_sentences = random.randint(1, 10)
        time.sleep(2)
        print(num_sentences)
        for _ in range(num_sentences):
            word_dict = random.choice(words)
            word = word_dict["word"]
            singularity = word_dict["singularity"]
            adjective = random.choice(adjectives)
            
            verb = "is" if singularity == "singular" else "are"
            
            sentence = f"{word.capitalize()} {verb} {adjective}. "
            
            response_json = json.dumps({
                "message": {
                    "content": sentence
                }
            })
            yield response_json + "\n"
            time.sleep(0.5)

    return Response(generate(), mimetype='application/json')

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=9999)
