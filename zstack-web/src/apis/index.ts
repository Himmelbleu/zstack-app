import request from "./use-axios";

export async function getTempHumiAll(body: TempHumiData) {
  const { data } = await request.post("/temphu/query/all", body);
  return data;
}

export async function getAbtAll(body: AbtData) {
  const { data } = await request.post("/abt/query/all", body);
  return data;
}

export async function getTempHumiLimit(body: { limit: number }) {
  const { data } = await request.post("/temphu/query/all/limit", body);
  return data;
}

export async function getTempHumiStateCount() {
  const { data } = await request.post("/temphu/query/stateCount");
  return data;
}

export async function getAbtStateCount() {
  const { data } = await request.post("/abt/query/stateCount");
  return data;
}
