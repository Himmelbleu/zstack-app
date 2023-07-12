import axios from "axios";

const request = axios.create({
  baseURL: `http://localhost:9000/api`,
  timeout: 5000
});

request.interceptors.request.use(
  config => {
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

export default request;
