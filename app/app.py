import logging
from flask import Flask, render_template_string, request

app = Flask(__name__)

# Configure logging
logging.basicConfig(filename='app.log', level=logging.INFO)
app.logger.addHandler(logging.StreamHandler())
app.logger.setLevel(logging.INFO)

HOME_HTML = '''
<!doctype html>
<title>Home</title>
<h1>Welcome to the Basic Flask App final Version2</h1>
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
@app.errorhandler(Exception)
def handle_exception(e):
    app.logger.error(f"Unhandled Exception: {e}")
    return "An error occurred: {}".format(e), 500
    
@app.route('/', methods=['GET'])
def home():
    return render_template_string(HOME_HTML)

@app.route('/submit', methods=['POST'])
def submit():
    try:
        name = request.form.get('name', 'Guest')
        return render_template_string(RESULT_HTML, name=name)
    except Exception as e:
        app.logger.error(f"Error occurred in /submit: {e}")
        return "Submission Error.", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
