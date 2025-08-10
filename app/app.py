from flask import Flask, render_template_string, request

app = Flask(__name__)

HOME_HTML = '''
<!doctype html>
<title>Home</title>
<h1>Welcome to the Basic Flask App final Version!</h1>
<form method="post" action="/submit">
  <label for="name">Enter your name:</label>
  <input type="text" id="name" name="name" required>
  <input type="submit" value="Submit">
</form>
'''

RESULT_HTML = '''
<!doctype html>
<title>Result</title>
<h1>Hello, {{ name }}!</h1>
<a href="/">Back to Home/a>
'''


@app.route('/', methods=['GET'])
def home():
    return render_template_string(HOME_HTML)


@app.route('/submit', methods=['POST'])
def submit():
    name = request.form.get('name', 'Guest')
    return render_template_string(RESULT_HTML, name=name)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
