# CustomerIOSDK

CustomerIOSDK is a framework using https://swapi.dev for REST APIs and Swift as the platform.


**Objective**

- CustomerIOSDK using StarWars RestAPI
- Sample App to integrate SDK

# Demo

![ezgif-3-7b34e24650a0](https://user-images.githubusercontent.com/42139833/131508803-3f489133-4a90-4db1-b7aa-ea19b1c77f2f.gif)


# Installation

Clone **StarWarsMobileApp** and run it directly. In case you face difficulty in running it then follow the steps given below :

- Open StarWarsMobileApp.xcworkspace in XCode
- Right click on StarWarsMobileApp folder
- Click on _Add Files to StarWarsMobileApp_
<img width="300" alt="Screenshot 2021-08-31 at 6 10 25 PM" src="https://user-images.githubusercontent.com/42139833/131504342-017427fa-489c-4941-ae69-ce63f1bd4e36.png">

- Navigate to CustomerioStarWars and select _CustomerioStarWars.xcodeproj_. Click on **Add**
<img width="500" alt="Screenshot 2021-08-31 at 6 17 28 PM" src="https://user-images.githubusercontent.com/42139833/131505253-e5cd009a-d857-47a5-9f34-bd3c9bccfacc.png">


Next, you need to add this framework in Frameworks and Libraries in your demo app.

- Go to Target of the demo app
- Go to General tab and scroll down to _Frameworks, Libraries, and Embedded Content_
- Click on + button 
- Select **CustomerioStarWars.framework**
<img width="250" alt="Screenshot 2021-08-31 at 6 23 15 PM" src="https://user-images.githubusercontent.com/42139833/131505937-120514ee-e306-49c4-8246-90135a979dc0.png">

- Make sure that the selected framework is now visible under _Frameworks, Libraries, and Embedded Content_ 
<img width="650" alt="Screenshot 2021-08-31 at 6 21 50 PM" src="https://user-images.githubusercontent.com/42139833/131505948-576be56e-3021-48f4-b210-e1b3f4ac9426.png">

Run the application and see the magic happening.

# SDK Usage

To make the usage of SDK simple, CustomerIOStarWars SDK provides access to a manager class **CIOManager** which solely handles all API requests and return the response to the respective controller/class.

SDK provides the following functions :
- getPlanets
- getPeopleEyes
- getAllFilms

Before using any SDK functions, make sure to import the framework in the file. Following is a usecase to get population of 5 different planets along with their population and climate details.


```
import CustomerioStarWars

class MyHomeViewController: UIViewController {
  let sdkManager = CIOManager()
  let planetCount = 5
  
  override func viewDidLoad() {
        super.viewDidLoad()

        sdkManager.getPlanets(forCount: planetCount) { planetData in
            
            DispatchQueue.main.async {
                // Update UI or perform the task as required
            }
        }
    }
}
```



# Troubleshooting

Still facing issues compiling it or have questions ? Please feel free to connect.
