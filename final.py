import streamlit as st
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt


def retrieve_data():
        # Connect to MySQL database
        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
        )


        # Create a cursor
        cursor = mydb.cursor()

        # Execute a query to select data from 'project' table
        query = "SELECT title FROM project "
        cursor.execute(query)

        # Fetch all results
        results = cursor.fetchall()

        # Get column names
        columns = [desc[0] for desc in cursor.description]

        # Create a DataFrame from the results
        df = pd.DataFrame(results, columns=columns)

        # Close cursor and database connection
        cursor.close()
        mydb.close()

        return df

def retrieve_cast_for_movie(selected_movie):
    # Connect to MySQL database
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
    )

    # Create a cursor
    cursor = mydb.cursor()

    # Execute a query to select cast members for the selected movie
    query = f"""
        SELECT film_cast.name,film_cast.cast_ID
        FROM project
        JOIN cast_movie ON project.project_ID = cast_movie.project_ID
        JOIN film_cast ON cast_movie.cast_ID = film_cast.cast_ID
        WHERE project.title = '{selected_movie}'
    """
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Close cursor and database connection
    cursor.close()
    mydb.close()

    return results

def retrieve_actor_movies(cast_id):
    # Connect to MySQL database
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
    )

    # Create a cursor
    cursor = mydb.cursor()

    # Execute a query to select movies for the selected actor
    query = f"""
        SELECT project.title
        FROM cast_movie
        JOIN project ON cast_movie.project_ID = project.project_ID
        WHERE cast_movie.cast_ID = {cast_id}
    """
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Close cursor and database connection
    cursor.close()
    mydb.close()

    # Extract movie titles from the results
    movie_titles = [movie[0] for movie in results]

    return movie_titles


def retreive_crew_for_movie(selected_movie):
        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
        )   

        # Create a cursor
        cursor = mydb.cursor()

        # Execute a query to select cast members for the selected movie
        query = f"""
                SELECT crew.name,crew.crew_ID
                FROM project
                JOIN crew_movie ON project.project_ID = crew_movie.project_ID
                JOIN crew ON crew_movie.crew_ID = crew.crew_ID
                WHERE project.title = '{selected_movie}'
        """
        cursor.execute(query)

        # Fetch all results
        results = cursor.fetchall()

        # Close cursor and database connection
        cursor.close()
        mydb.close()

        return results

def retrieve_dir_prod_for_movie(selected_movie):
        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
        )   

        # Create a cursor
        cursor = mydb.cursor()

        # Execute a query to select cast members for the selected movie
        query = f"""
                SELECT crew.name,crew.crew_ID,crew.role
                FROM project
                JOIN crew_movie ON project.project_ID = crew_movie.project_ID
                JOIN crew ON crew_movie.crew_ID = crew.crew_ID
                WHERE project.title = '{selected_movie}'
                AND crew.role='director'
        """
        cursor.execute(query)

        # Fetch all results
        results1 = cursor.fetchall()

        query = f"""
                SELECT crew.name,crew.crew_ID,crew.role
                FROM project
                JOIN crew_movie ON project.project_ID = crew_movie.project_ID
                JOIN crew ON crew_movie.crew_ID = crew.crew_ID
                WHERE project.title = '{selected_movie}'
                AND crew.role='producer'
        """
        cursor.execute(query)

        # Fetch all results
        results2 = cursor.fetchall()

        query = f"""
                SELECT crew.name,crew.crew_ID,crew.role
                FROM project
                JOIN crew_movie ON project.project_ID = crew_movie.project_ID
                JOIN crew ON crew_movie.crew_ID = crew.crew_ID
                WHERE project.title = '{selected_movie}'
                AND NOT(crew.role='producer' OR crew.role='director') 
        """

        cursor.execute(query)

        # Fetch all results
        results3 = cursor.fetchall()

        results = []

        results.append(results1[0])
        results.append(results2[0])
        
        for i in results3:
             results.append(i)
        

        # Close cursor and database connection
        cursor.close()
        mydb.close()

        return results



def retrieve_project_details(selected_movie):
    # Connect to MySQL database
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
    )

    # Create a cursor
    cursor = mydb.cursor()

    # Execute a query to select details for the selected movie
    query = f"SELECT * FROM project WHERE title = '{selected_movie}'"
    cursor.execute(query)

    # Fetch the result
    result = cursor.fetchone()

    # Close cursor and database connection
    cursor.close()
    mydb.close()

    return result


def get_cost(selected_option,project_id):
    connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@rehan@sql123",
    database="film_production"
    )

    cursor = connection.cursor()

    # Call the stored procedure
    cursor.callproc('CalculateTotalCost', (project_id, selected_option, 0))

    # Fetch the result from the OUT parameter
    cursor.execute("SELECT @p_totalCost;")
    result = cursor.fetchone()
    total_cost = result[0]

    cursor.close()
    connection.close()

    return total_cost
    

def get_user_grants(username):
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
    )
    cursor = connection.cursor()

    # Query the mysql.user table for user information
    query = f"SHOW GRANTS FOR '{username}'@'localhost';"
    cursor.execute(query)
    user_grants = cursor.fetchall()

    # Close the cursor and connection
    cursor.close()
    connection.close()

    return user_grants



def retrieve_track_details(selected_movie):
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@rehan@sql123",
    database="film_production"
    )   

    # Create a cursor
    cursor = mydb.cursor()

    # Execute a query to select cast members for the selected movie
    query = f"""
            SELECT
                st.track_name,st.track_ID,st.cost
            FROM
                sound_track st
            WHERE
                st.project_ID = (
                SELECT project_ID
                FROM project
                WHERE title = '{selected_movie}'
    );

    """
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Close cursor and database connection
    cursor.close()
    mydb.close()

    return results


def retrieve_singer_details(track_id):
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@rehan@sql123",
    database="film_production"
    )   

    # Create a cursor
    cursor = mydb.cursor()

    # Execute a query to select cast members for the selected movie
    query = f"""
            SELECT
                sn.name,sn.cost
            FROM
                soundtrack_singers sn
            WHERE
                sn.track_ID = {track_id};
    """
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Close cursor and database connection
    cursor.close()
    mydb.close()

    return results

# Main page content
def main():
    st.title("Film Production Company Dashboard")
    
    # Add features to the main page
    st.write("Welcome to the Film Production Company Dashboard")

    if st.session_state.user_info:
         username = st.session_state.user_info

    # Get user grants
    user_grants = get_user_grants(username)

    # Extract privileges from user grants
    privileges = [grant[0] for grant in user_grants]

    # Sidebar
    st.sidebar.title("Options")

    # Feature 1: Selectbox with "Retrieve Data" option
    sidebar_option = st.sidebar.selectbox("Select Feature", ["Retrieve Data", "Insert Data", "Update Data","Delete Data"])

    # print(privileges[1].split(' ')[1])

    p = privileges[1].split(' ')[1]

    if p=='ALL':
        priv = ['SELECT','INSERT','DELETE','UPDATE']
    
    elif p=='SELECT':
        priv = ['SELECT']  


    # Feature 1: Data Retrieval
    if sidebar_option=="Retrieve Data":
        st.subheader("PROJECTS")
        data = retrieve_data()

        selected_movie = st.selectbox("Select a project",["--SELECT--"] + list(data['title']))
        
        if selected_movie != "--SELECT--" and st.button("Show Details"):
                # Retrieve and display details for the selected movie
                project_details = retrieve_project_details(selected_movie)
                cast_details = retrieve_cast_for_movie(selected_movie)
                crew_details = retrieve_dir_prod_for_movie(selected_movie)
                track_details = retrieve_track_details(selected_movie)

                
                st.write('-----------------------------------------------')

                col1, col2, col3 = st.columns(3)

                
                # Display details in each column
                with col1:
                        st.write('### Title')
                        st.write(project_details[1])

                with col2:
                        st.write('### Budget')
                        st.write(project_details[2])

                with col3:
                        st.write('### Status')
                        st.write(project_details[3])
                
                st.write('-----------------------------------------------')

                st.write('### Cast')

                for it in cast_details:
                    expander_content = f"{it[0]}"

                    with st.expander(expander_content):
                            cast_details = retrieve_actor_movies(it[1])
                            st.write('#### Movies')
                            for i in cast_details:
                                st.write(i)

                st.write('-----------------------------------------------')

                st.write('## Crew')

                st.write('### Director')
                st.write(crew_details[0][0])

                st.write('### Producer')
                st.write(crew_details[1][0])

                st.write('### Other crew members')

                for it in range(2,len(crew_details)):
                    st.write(f"{crew_details[it][0]} - {crew_details[it][2]}")

                st.write('-----------------------------------------------')

                st.write("## Music")
 
                for it in track_details:
                    expander_content = f"{it[0]}"

                    with st.expander(expander_content):
                        singer_details = retrieve_singer_details(it[1])
                        for i in singer_details:
                            st.write(i[0])
                        



                st.write('-----------------------------------------------')



                st.write("## Expenses")

                total_cost = []

                tables = ["cast_movie", "crew_movie","distribution", "marketing", "equipment"]

                project_id = project_details[0]

                for i in tables:
                    cost = get_cost(i,project_id)
                    total_cost.append(cost)

                music_cost=0

                singer_details = retrieve_track_details(selected_movie)
                
                for it in singer_details:
                    music_cost+=it[2]
                    singer = retrieve_singer_details(it[1])
                    music_cost+=singer[0][1]
                
                total_cost.append(music_cost)

                


                # Headers for the categories
                categories = ["Cast Salaries", "Crew Salaries", "Distribution", "Marketing", "Equipments","Music"]

                # Plotting the pie chart
                fig, ax = plt.subplots()
                ax.pie(total_cost, labels=categories, autopct='%1.1f%%', startangle=90)
                ax.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

                # Display the pie chart in Streamlit
                st.pyplot(fig)
                                



    if sidebar_option=="Insert Data":

        if 'INSERT' in priv:
            db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="@rehan@sql123",
            database="film_production")

            cursor = db_connection.cursor()

            # Streamlit App
            st.title("Data Entry Form")
            
            movie_title = st.text_input("Movie Title:")
            budget = st.text_input("Budget:")
            status = st.text_input("Status:")
            genre = st.text_input("Genre:")

            if 'cast_details' not in st.session_state:
                st.session_state.cast_details = []

            with st.expander("Enter Cast Details"):
                num = st.number_input("Number of cast members:", min_value=1)

                for i in range(num):
                    cast_name = st.text_input(f"Enter cast member {i+1} name:", key=f"cast{i}")
                    cast_manager_name = st.text_input(f"Enter cast manager {i+1} name:", key=f"manager{i}")
                    cast_contact = st.text_input(f"Enter cast {i+1} contact:", key=f"contact{i}")
                    cast_salary = st.text_input(f"Enter cast {i+1} salary:", key=f"salary{i}")

                    if st.button(f"Submit {i+1}", key=f"castbutton{i}"):
                        cast_detail = [cast_name, cast_manager_name, cast_contact, cast_salary]

                        # Append to the session state variable
                        st.session_state.cast_details.append(cast_detail)

            if 'crew_details' not in st.session_state:
                st.session_state.crew_details = []

            with st.expander("Enter Crew details:"):
                # Form to enter data into the Crew table
                director = st.text_input("Enter Director Name:")
                dir_contact = st.text_input("Enter Director Contact:")
                dir_salary = st.text_input("Enter Director salary:")
                producer = st.text_input("Enter producer Name:")
                prod_contact = st.text_input("Enter Producer Contact:")
                prod_salary = st.text_input("Enter Producer Salary:")

                # Append director and producer details if "Submit" button is clicked
                if st.button("Submit Director and Producer", key="submit_director_producer"):
                    st.session_state.crew_details.append([director, dir_contact, dir_salary, 'Director'])
                    st.session_state.crew_details.append([producer, prod_contact, prod_salary, 'Producer'])

                num = st.number_input("Number of crew members:", min_value=1)

                for i in range(num):
                    crew_name = st.text_input(f"Enter crew member {i+1} name:", key=f"crew{i}")
                    crew_contact = st.text_input(f"Enter crew {i+1} contact:", key=f"cont{i}")
                    crew_salary = st.text_input(f"Enter crew {i+1} salary:", key=f"sal{i}")
                    crew_role = st.selectbox("Select Role:",
                                            ["Cinematographer", "Production Designer", "Editor", "Sound Engineer",
                                            "Costume Designer", "Script Supervisor", "Makeup Artist", "Assistant Director"],
                                            key=f"role{i}")

                    if st.button(f"Submit {i+1}", key=f"crewbutton{i}"):
                        crew_detail = [crew_name, crew_contact, crew_salary, crew_role]

                        # Append to the session state variable
                        st.session_state.crew_details.append(crew_detail)
                    

            with st.expander("Enter Soundtrack details:"):
                track_name = st.text_input("Track Name:")
                expense = st.number_input("Expense:", min_value=0)
                label = st.text_input("Label:")
                composer = st.text_input("Composer:")
                snd_name = st.text_input("Singer Name:", max_chars=25)
                salary = st.number_input("Salary:", format="%.2f", min_value=0.0)
            
            with st.expander("Enter Location details:"):
                loc_name = st.text_input("Name:", max_chars=30)
                city = st.text_input("City:", max_chars=30)
                country = st.text_input("Country:", max_chars=20)
            
            with st.expander("Enter Distribution details:"):
                distributor_name = st.text_input("Distributor Name:", max_chars=30)
                release_date = st.date_input("Release Date:")
                cost = st.number_input("Cost:", format="%.2f", min_value=0.0)

            

            # Button to submit the form
            if st.button("Add Movie"):
                cursor.execute("SELECT MAX(project_id) FROM project")
                project_id = cursor.fetchone()[0]+1

                db_connection.commit()

                insert_query1 = "INSERT INTO project(project_ID,title, budget, status, genre) VALUES (%s,%s, %s, %s, %s)"
                movie_data = (project_id,movie_title,budget,status,genre)

                cursor.execute(insert_query1, movie_data)

                db_connection.commit()



                cursor.execute("SELECT MAX(distributor_id) FROM distribution")
                dist_id = cursor.fetchone()[0]+1

                db_connection.commit()

                insert_query2 = "INSERT INTO distribution(distributor_ID,distributor_name,release_date,cost,project_id) VALUES (%s,%s,%s,%s,%s)"
                dist_data = (dist_id,distributor_name,release_date,cost,project_id)

                cursor.execute(insert_query2, dist_data)
                db_connection.commit()



                cursor.execute("SELECT MAX(location_id) FROM location")
                loc_id = cursor.fetchone()[0]+1
                db_connection.commit()

                insert_query3 = "INSERT INTO location(location_ID,name,city,country) VALUES (%s,%s,%s,%s)"
                loc_data = (loc_id,loc_name,city,country)

                cursor.execute(insert_query3, loc_data)
                db_connection.commit()
                



                cursor.execute("SELECT MAX(track_id) FROM sound_track")
                track_id = cursor.fetchone()[0]+1

                db_connection.commit()

                insert_query4 = "INSERT INTO sound_track(track_ID,track_name, cost, label, composer, project_ID) VALUES (%s,%s, %s, %s, %s, %s)"
                snd_data = (track_id,track_name, expense, label, composer, project_id)

                cursor.execute(insert_query4, snd_data)
                db_connection.commit()

                


                cursor.execute("SELECT MAX(singer_ID) FROM soundtrack_singers")
                snd_id = cursor.fetchone()[0]+1

                db_connection.commit()
                

                insert_query5 = "INSERT INTO soundtrack_singers(singer_ID,name, cost, track_ID) VALUES (%s,%s, %s, %s)"
                sin_data = (snd_id,snd_name, salary, track_id)

                cursor.execute(insert_query5, sin_data)
                db_connection.commit()




                insert_query6 = "INSERT INTO shot_at(location_ID, project_ID) VALUES (%s, %s)"
                shot_data = (loc_id,project_id)


                cursor.execute(insert_query6, shot_data)
                db_connection.commit()




                cursor.execute("SELECT MAX(cast_id) FROM film_cast")
                cast_id = cursor.fetchone()[0]

                db_connection.commit()

                insert_query7 = "INSERT INTO film_cast(cast_ID,name, manager_name, contact_info) VALUES (%s,%s, %s, %s)"
                insert_query8 = "INSERT INTO cast_movie(cast_ID, cost, project_ID) VALUES (%s, %s, %s)"

                
                

                for cast_list in st.session_state.cast_details:
                    cast_name, cast_manager_name, cast_contact, cast_salary = cast_list
                    cast_id+=1

                    cast_data = (cast_id,cast_name, cast_manager_name, cast_contact)

                    cast_movie_data = (cast_id,cast_salary,project_id)

                    print(cast_data)

                    print(cast_movie_data)

                    try:
                        cursor.execute(insert_query7,cast_data)
                        db_connection.commit()

                        cursor.execute(insert_query8,cast_movie_data)
                        db_connection.commit()

                    except Exception as e:
                        st.error(f"Error: {str(e)}")


                cursor.execute("SELECT MAX(crew_id) FROM crew")
                crew_id = cursor.fetchone()[0]
                db_connection.commit()


                insert_query9 = "INSERT INTO crew(crew_ID,name, role, contact_info) VALUES (%s,%s, %s, %s)"
                insert_query10 = "INSERT INTO crew_movie(crew_id,cost,project_id) VALUES (%s, %s, %s)"

                

                # Iterate through crew details in session state
                for crew_list in st.session_state.crew_details:
                    # print(crew_list)
                    crew_name,crew_contact, crew_salary,crew_role = crew_list
                    crew_id += 1

                    crew_data = (crew_id,crew_name, crew_role, crew_contact)

                    print(crew_data)

                    crew_project_data = (crew_id, crew_salary, project_id)

                    print(crew_project_data)

                    try:
                        cursor.execute(insert_query9, crew_data)
                        db_connection.commit()

                        cursor.execute(insert_query10, crew_project_data)
                        db_connection.commit()

                    except Exception as e:
                        st.error(f"Error: {str(e)}")
                    

                try:
                    st.success("Movie added successfully!")
                except Exception as e:
                    st.error(f"Error: {str(e)}")

            # Close database connection
            cursor.close()
            db_connection.close()
        else:
            st.warning("You do not have INSERT access")
            sidebar_option = "Retrieve Data"
        


    if sidebar_option=="Update Data":

        if 'UPDATE' in priv:
            st.title('Table Data Updater')

            # Dropdown to select table
            selected_table = st.selectbox('Select Table', get_table_names())

            # Ask user for record ID
            record_id = st.text_input('Enter Record ID:', type='default')

            # Get and display column names of the selected table
            if selected_table:
                column_names = get_column_names(selected_table)

                # Dropdown to select column
                selected_column = st.selectbox('Select Column', column_names)

                # Text input for the new value
                new_value = st.text_input(f'Enter new value for {selected_column}:', key=selected_column)

                # Update button
                if st.button('Update Record'):
                    # Update the selected column with the new value in the database
                    update_value(selected_table, selected_column, new_value, record_id)
                    st.success('Record Updated Successfully!')
        else:
            st.warning("You do not have UPDATE access")
            sidebar_option = "Retrieve Data"


    if sidebar_option=="Delete Data":
        # Database connection configuration
        if 'DELETE' in priv:
            st.title('Project Data Deletion')

            # Ask user for project ID to delete
            project_id = st.text_input('Enter Project ID to Delete:', type='default')

            # Delete button
            if st.button('Delete Project'):
                if project_id:
                    # Delete the specified record from the 'project' table
                    delete_project_record(project_id)
                    st.success('Project Deleted Successfully!')
        
        else:
            st.warning("You do not have DELETE access")
            sidebar_option = "Retrieve Data"
        


# Function to delete a row from the 'project' table
def delete_project_record(record_id):
    connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@rehan@sql123",
    database="film_production"
)
    cursor = connection.cursor()
    cursor.execute("DELETE FROM project WHERE project_id = %s;", (record_id,))
    connection.commit()
    connection.close()


# Function to get all table names from the database
def get_table_names():
    # Database connection configuration
    connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="@rehan@sql123",
            database="film_production"
        )
    cursor = connection.cursor()
    cursor.execute("SHOW TABLES;")
    tables = cursor.fetchall()
    connection.close()
    return [table[0] for table in tables]

# Function to get column names of a table
def get_column_names(table_name):
    # Database connection configuration
    connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@rehan@sql123",
    database="film_production"
)
    cursor = connection.cursor()
    cursor.execute(f"DESCRIBE {table_name};")
    columns = cursor.fetchall()
    connection.close()
    return [column[0] for column in columns]

# Function to update a value in the selected table
def update_value(table_name, column_name, new_value, record_id):
    # Database connection configuration
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
    )
    cursor = connection.cursor()
    cursor.execute(f"UPDATE {table_name} SET {column_name} = %s WHERE {table_name}_id = %s;", (new_value, record_id))
    connection.commit()
    connection.close()



def authenticate_user(username, password):
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@rehan@sql123",
        database="film_production"
    )

    try:
        cursor = connection.cursor()

        # Query the mysql.user table for user information
        query = f"SELECT User FROM mysql.user WHERE User = '{username}';"
        cursor.execute(query)
        user_info = cursor.fetchone()

        if user_info:
            return user_info[0]
        else:
            return None  # Authentication failed
    except mysql.connector.Error as err:
        return None  # Authentication failed
    finally:
        connection.close()



# Check if user information is already stored in session state
if 'user_info' not in st.session_state:
    st.title('LOGIN')
    # User is not logged in, show login form
    username=st.text_input('Username:')
    password=st.text_input('Password:', type='password')

    if st.button('Login'):
        # Authenticate user
        user_info = authenticate_user(username, password)

        if user_info:
            # Store user information in session state
            st.session_state.user_info = user_info

            st.success('Authentication successful!')

else:
    # User is logged in, proceed with the main page
    main()