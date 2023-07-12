type TempHumiData = Partial<{
  id: number;
  temp: string;
  humi: string;
  date: string;
  state: string;
  ledState: string;
  name: string;
  sno: string;
  pageNum: number;
  pageSize: number;
  tempOper: string;
  humiOper: string;
}>;

type AbtData = Partial<{
  id: number;
  state: string;
  date: string;
  msg: string;
  ledState: string;
  name: string;
  sno: string;
  pageNum: number;
  pageSize: number;
}>;
