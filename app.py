from flask import*
import pymysql
from functions import *
from mpesa import *
app=Flask(__name__)
# session key 
app.secret_key="!@#$%^"
app.config['SECRET_KEY'] = 'your_secret_key_here'
@app.route("/")
def Homepage():
   
#    connect to DB 

 connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
 sql="select * from products WHERE product_category = 'cups' "
 sql1="select * from products WHERE product_category = 'plates' "
 sql2="select * from products WHERE product_category ='hotpots' "
 sql3="select * from products WHERE product_category ='glasses' "
 
 
#  you need to have a cursor 
#  cursor-used to run /execute above sql 
 cursor=connection.cursor()
 cursor1=connection.cursor()
 cursor2=connection.cursor()
 cursor3=connection.cursor()


#  execute 
 cursor.execute(sql)
 cursor1.execute(sql1)
 cursor2.execute(sql2)
 cursor3.execute(sql3)


#  fetch  all the  rows

 cups=cursor.fetchall()
# fetch all monitors 
 plates=cursor1.fetchall()
 hotpots=cursor2.fetchall()
 glasses=cursor3.fetchall()

 return render_template("index.html",cups = cups,plates =plates,hotpots = hotpots,glasses = glasses)

# route fo a single item 
@app.route("/single/<product_id>")
def singleitem(product_id):
    # connection to db 
     connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
# create sql query 
     sql= " select * from products where product_id = %s "
    #  create a cursor 
     cursor =connection.cursor()
     cursor.execute(sql,product_id)
    #  get the single product 
     product=cursor.fetchone() 
     return render_template ("single.html",product=product)

#upload products
@app.route("/upload",methods=['POST','GET'])
def Upload():
    if request.method == 'POST':
        # uer can add the products 
        product_name= request.form['product_name']
        product_desc =request.form['product_desc']
        product_cost =request.form['product_cost']
        product_category =request.form['product_category']
        product_image_name =request.files['product_image_name']
        product_image_name.save('static/images/' +  product_image_name.filename )

        # connection to db 

        connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
        cursor=connection.cursor()

        sql= "insert into products (product_name, product_desc, product_cost, product_category, product_image_name) values(%s,%s,%s,%s,%s)"
        data = product_name, product_desc,product_cost,product_category ,product_image_name.filename


        # execute
        cursor.execute(sql,data)
        # save the changes 
        connection.commit()

        return render_template("upload.html", message = "product added successful")

    else:
     return render_template("upload.html", error = "please add a product ")
    
# fashion route-helps you nto see all the fashion 
@app.route("/decor")
def decor():
    connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
    sql="select * from products WHERE product_category = 'curtains' "
    sql1="select * from products WHERE product_category = 'carpets' "
    sql2="select * from products WHERE product_category ='doormats' "
    sql3="select * from products WHERE product_category ='flowervest' "
    sql4="select * from products WHERE product_category ='frames' "
    
 
 
#  you need to have a cursor 
#  cursor-used to run /execute above sql 
    cursor=connection.cursor()
    cursor1=connection.cursor()
    cursor2=connection.cursor()
    cursor3=connection.cursor()
    cursor4=connection.cursor()



#  execute 
    cursor.execute(sql)
    cursor1.execute(sql1)
    cursor2.execute(sql2)
    cursor3.execute(sql3)
    cursor4.execute(sql4)


#  fetch  all the phones rows

    curtains=cursor.fetchall()
# fetch all monitors 
    carpets=cursor1.fetchall()
    doormats=cursor2.fetchall()
    flowervest=cursor3.fetchall()
    frames=cursor4.fetchall()
    

    return render_template("decor.html",curtains=curtains,carpets= carpets,doormats=doormats ,flowervest=flowervest,frames=frames, )
# a route to upload fashion
@app.route("/uploaddecor",methods=['POST','GET'])
def Uploaddecor():
    if request.method == 'POST':
        # uer can add the products 
        product_name= request.form['product_name']
        product_desc =request.form['product_desc']
        product_cost =request.form['product_cost']
        product_category =request.form['product_category']
        product_image_name =request.files['product_image_name']
        product_image_name.save('static/images/' +  product_image_name.filename )

        # connection to db 

        connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
        cursor=connection.cursor()

        sql= "insert into products (product_name, product_desc, product_cost, product_category, product_image_name) values(%s,%s,%s,%s,%s)"
        data = product_name, product_desc,product_cost,product_category ,product_image_name.filename


        # execute
        cursor.execute(sql,data)
        # save the changes 
        connection.commit()

        return render_template("uploaddecor.html", message = "decor added successful")

    else:
     return render_template("uploaddecor.html", error = "please add a decor ")


@app.route("/about")
def About():
    return("this is about page")
# creating registration
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        gender = request.form['gender']
        phone = request.form['phone']
        password = request.form['password']
    
       
       # connection to db 

        connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
        cursor=connection.cursor()

        sql= "insert into users ( username,email,gender,phone,password )values(%s,%s,%s,%s,%s)"
        data = (username,email,gender,phone ,password)


        # execute
        cursor.execute(sql,data)
        # save the changes 
        connection.commit()

        return render_template("register.html", message = " successful registration ")

    else:
     return render_template("register.html", error = "please enter correct details ")

@app.route("/admin")
def admin():
    # Check if the user is logged in
    if 'key' not in session:
        return redirect("/login")  # Redirect to login if not logged in

    email = session['key']  # Retrieve the logged-in user's email from the session

    # Connect to the database
    connection = pymysql.connect(host='localhost', user='root', password='', database='smart')
    cursor = connection.cursor()

    # Query to check the user's role
    sql = "SELECT role FROM users WHERE email = %s"
    cursor.execute(sql, (email,))
    result = cursor.fetchone()  # Fetch the result from the query

    connection.close()  # Close the database connection

    # Check if the user has the 'admin' role
    if result and result[0] == 'admin':
        return render_template("admin.html")  # Allow access to the admin page
    else:
        return redirect("/")  # Redirect non-admin users to the homepage (or another page)

@app.route("/login", methods=['POST','GET'])
def Login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
    
       
       # connection to db 

        connection=pymysql.connect(host='localhost',user='root',password='',database='smart')
        cursor=connection.cursor()
#  check if user with email exist in the db 
        sql= "select * from users where email= %s and password = %s"
    
        data = (email,password)


        # execute
        cursor.execute(sql,data)
        # save the changes 
        if cursor.rowcount == 0:
            # it means if the username and password not found 

            return render_template("login.html", error= " invalid login credatials ")

        else:
            session['key']= email
            return redirect("/")
        
    return render_template("login.html")


@app.route("/view_payments")
def view_payments():
    # if 'key' not in session:
    #     return redirect("/login")

    connection = pymysql.connect(host='localhost', user='root', password='', database='smart')
    cursor = connection.cursor()
    
    # Query to get all payments
    sql = "SELECT p.id, p.amount, p.payment_date, u.username FROM payments p JOIN users u ON p.customer_id = u.id"
    cursor.execute(sql)
    payments = cursor.fetchall()
    
    connection.close()
    return render_template("view_payments.html", payments=payments)

# Admin Route to Add Payment
@app.route("/add_payment", methods=['GET', 'POST'])
def add_payment():
    # if 'key' not in session:
    #     return redirect("/login")

    if request.method == 'POST':
        customer_id = request.form['customer_id']
        amount = request.form['amount']
        payment_date = request.form['payment_date']
        
        connection = pymysql.connect(host='localhost', user='root', password='', database='smart')
        cursor = connection.cursor()
        
        sql = "INSERT INTO payments (customer_id, amount, payment_date) VALUES (%s, %s, %s)"
        cursor.execute(sql, (customer_id, amount, payment_date))
        connection.commit()
        connection.close()
        
        return redirect("add_payments")  # Redirect to the payments view after adding
        
    # If GET request, display the add payment form
    connection = pymysql.connect(host='localhost', user='root', password='', database='smart')
    cursor = connection.cursor()
    cursor.execute("SELECT id, username FROM users")  # Get all users to select customer
    customers = cursor.fetchall()
    connection.close()

    return render_template("add_payment.html", customers=customers)

# Additional routes (register, login, etc.) remain unchanged...

# @app.route("/admin")
# def admin():
#     if 'key' not in session:
#         return redirect("/login")
    
#     return render_template("admin.html")

    # mpesa  
    # implement STK PUSH 
@app.route('/mpesa', methods= ['POST'])
def mpesa():
   phone=request.form["phone"]
   amount=request.form["amount"]
   #use mpesa_payment function from mpesa.py 
   #it accepts the phone and amount as arguments
   mpesa_payment("1",phone) 



   return'<h1>Please complete payment in your form</h1>'\
   '<a href="/" class="btn btn-dark btn-sm">GO back to products </a>'

@app.route("/logout")
def Logout():
    session.clear()
    return redirect("/login")
if __name__=="__main__":
    app.run(debug= True,port=4000)
