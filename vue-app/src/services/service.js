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
      spending.sort((a, b) => a.record_time - b.record_time);
      return spending;
    } catch (err) {
      throw err;
    }
  }
  async getSpendingByDate(start, end) {
    try {
      start = this.formatDateToEpoch(start);
      end = this.formatDateToEpoch(end);
      end += 86400;
      const res = await axios.get("http://localhost:3000/spending");
      const spendingByDate = res.data.filter(elem => elem.record_time >= start && elem.record_time <= end);
      spendingByDate.sort((a, b) => a.record_time - b.record_time);
      return spendingByDate;
    } catch (err) {
      throw err;
    }
  }
  formatDateToString(input) {
    const date = new Date(input * 1000);
    const formattedDate = date.toDateString();
    return formattedDate;
  }
  formatDateToEpoch(input) {
    function toEpochDate(date) {
      return Math.floor(date.getTime() / 1000);
    }
    const date = new Date(input);
    const epochDate = toEpochDate(date);
    return epochDate;
  }
}
