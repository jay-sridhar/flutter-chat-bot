from flask import Flask, Response, jsonify
import random
import time
import json

app = Flask(__name__)

words = ["time", "year", "people", "way", "day", "man", "thing", "woman", "life", "child", "world", "school", "state", "family", "student", "group", "country", "problem", "hand", "part", "place", "case", "week", "company", "system", "program", "question", "work", "government", "number", "night", "point", "home", "water", "room", "mother", "area", "money", "story", "fact", "month", "lot", "right", "study", "book", "eye", "job", "word", "business", "issue", "GPT", "side", "kind", "head", "house", "service", "friend", "father", "power", "hour", "game", "line", "end", "member", "law", "car", "city", "community", "name", "flutter", "president", "team", "minute", "idea", "kid", "body", "information", "back", "parent", "face", "others", "level", "office", "door", "health", "person", "art", "war", "history", "party", "result", "change", "morning", "reason", "research", "girl", "guy", "moment", "air", "teacher", "force", "education"]

@app.route('/api/chat', methods=['POST'])
def random_words():
    def generate():
        num_words = random.randint(5, 25)  
        print(f"numwords: {num_words}")
        time.sleep(2)
        for _ in range(num_words):
            word = f"{random.choice(words)} "
            response_json = json.dumps({
                "message": {
                    "content": word
                }
            })
            yield response_json + "\n"
            time.sleep(0.25) 

    return Response(generate(), mimetype='application/json')

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=9999)
