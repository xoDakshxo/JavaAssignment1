import org.json.JSONObject;
import org.json.JSONException;

public class nine_JSONProcessing {

    public static void main(String[] args) throws JSONException {
        // Creating a JSON Object
        JSONObject obj = new JSONObject();
        obj.put("name", "John Doe");
        obj.put("age", 30);
        obj.put("city", "New York");

        // JSON String
        String jsonString = obj.toString();
        System.out.println("JSON String: " + jsonString);

        // Parsing JSON String
        JSONObject parsedObj = new JSONObject(jsonString);
        System.out.println("Parsed JSON: Name is " + parsedObj.getString("name"));
    }
}
