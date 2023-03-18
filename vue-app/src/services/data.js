import axios from "axios";

export class dataService {
  async getUsers() {
    try {
      const res = await axios.get("http://localhost:3000/users");
      const user = res.data[0].name;
      return user;
    } catch (err) {
      throw err;
    }
  }
  async getSpending() {
    try {
      const res = await axios.get("http://localhost:3000/spending");
      const spending = res.data;
      return spending;
    } catch (err) {
      throw err;
    }
  }
}
