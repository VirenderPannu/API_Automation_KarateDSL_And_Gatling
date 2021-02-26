var stats = {
    type: "GROUP",
name: "Global Information",
path: "",
pathFormatted: "group_missing-name-b06d1",
stats: {
    "name": "Global Information",
    "numberOfRequests": {
        "total": "637",
        "ok": "417",
        "ko": "220"
    },
    "minResponseTime": {
        "total": "650",
        "ok": "650",
        "ko": "1692"
    },
    "maxResponseTime": {
        "total": "30456",
        "ok": "29812",
        "ko": "30456"
    },
    "meanResponseTime": {
        "total": "13523",
        "ok": "12425",
        "ko": "15606"
    },
    "standardDeviation": {
        "total": "8298",
        "ok": "7416",
        "ko": "9406"
    },
    "percentiles1": {
        "total": "12770",
        "ok": "12211",
        "ko": "13587"
    },
    "percentiles2": {
        "total": "18090",
        "ok": "17306",
        "ko": "24782"
    },
    "percentiles3": {
        "total": "29821",
        "ok": "27490",
        "ko": "30156"
    },
    "percentiles4": {
        "total": "30160",
        "ok": "29421",
        "ko": "30175"
    },
    "group1": {
        "name": "t < 800 ms",
        "count": 21,
        "percentage": 3
    },
    "group2": {
        "name": "800 ms < t < 1200 ms",
        "count": 21,
        "percentage": 3
    },
    "group3": {
        "name": "t > 1200 ms",
        "count": 375,
        "percentage": 59
    },
    "group4": {
        "name": "failed",
        "count": 220,
        "percentage": 35
    },
    "meanNumberOfRequestsPerSecond": {
        "total": "4.65",
        "ok": "3.044",
        "ko": "1.606"
    }
},
contents: {
"req_create-article--30eb8": {
        type: "REQUEST",
        name: "Create Article - RESULT",
path: "Create Article - RESULT",
pathFormatted: "req_create-article--30eb8",
stats: {
    "name": "Create Article - RESULT",
    "numberOfRequests": {
        "total": "370",
        "ok": "267",
        "ko": "103"
    },
    "minResponseTime": {
        "total": "710",
        "ok": "710",
        "ko": "1692"
    },
    "maxResponseTime": {
        "total": "30456",
        "ok": "29812",
        "ko": "30456"
    },
    "meanResponseTime": {
        "total": "13283",
        "ok": "11918",
        "ko": "16820"
    },
    "standardDeviation": {
        "total": "8439",
        "ok": "7738",
        "ko": "9126"
    },
    "percentiles1": {
        "total": "11346",
        "ok": "10405",
        "ko": "15351"
    },
    "percentiles2": {
        "total": "18907",
        "ok": "16449",
        "ko": "25379"
    },
    "percentiles3": {
        "total": "29764",
        "ok": "27907",
        "ko": "30164"
    },
    "percentiles4": {
        "total": "30167",
        "ok": "29660",
        "ko": "30449"
    },
    "group1": {
        "name": "t < 800 ms",
        "count": 9,
        "percentage": 2
    },
    "group2": {
        "name": "800 ms < t < 1200 ms",
        "count": 13,
        "percentage": 4
    },
    "group3": {
        "name": "t > 1200 ms",
        "count": 245,
        "percentage": 66
    },
    "group4": {
        "name": "failed",
        "count": 103,
        "percentage": 28
    },
    "meanNumberOfRequestsPerSecond": {
        "total": "2.701",
        "ok": "1.949",
        "ko": "0.752"
    }
}
    },"req_delete-article--86cc8": {
        type: "REQUEST",
        name: "Delete Article - RESULT",
path: "Delete Article - RESULT",
pathFormatted: "req_delete-article--86cc8",
stats: {
    "name": "Delete Article - RESULT",
    "numberOfRequests": {
        "total": "267",
        "ok": "150",
        "ko": "117"
    },
    "minResponseTime": {
        "total": "650",
        "ok": "650",
        "ko": "1703"
    },
    "maxResponseTime": {
        "total": "30160",
        "ok": "28677",
        "ko": "30160"
    },
    "meanResponseTime": {
        "total": "13857",
        "ok": "13326",
        "ko": "14537"
    },
    "standardDeviation": {
        "total": "8085",
        "ok": "6713",
        "ko": "9518"
    },
    "percentiles1": {
        "total": "15428",
        "ok": "15822",
        "ko": "11393"
    },
    "percentiles2": {
        "total": "17843",
        "ok": "17449",
        "ko": "24071"
    },
    "percentiles3": {
        "total": "30002",
        "ok": "19935",
        "ko": "30150"
    },
    "percentiles4": {
        "total": "30154",
        "ok": "27059",
        "ko": "30156"
    },
    "group1": {
        "name": "t < 800 ms",
        "count": 12,
        "percentage": 4
    },
    "group2": {
        "name": "800 ms < t < 1200 ms",
        "count": 8,
        "percentage": 3
    },
    "group3": {
        "name": "t > 1200 ms",
        "count": 130,
        "percentage": 49
    },
    "group4": {
        "name": "failed",
        "count": 117,
        "percentage": 44
    },
    "meanNumberOfRequestsPerSecond": {
        "total": "1.949",
        "ok": "1.095",
        "ko": "0.854"
    }
}
    }
}

}

function fillStats(stat){
    $("#numberOfRequests").append(stat.numberOfRequests.total);
    $("#numberOfRequestsOK").append(stat.numberOfRequests.ok);
    $("#numberOfRequestsKO").append(stat.numberOfRequests.ko);

    $("#minResponseTime").append(stat.minResponseTime.total);
    $("#minResponseTimeOK").append(stat.minResponseTime.ok);
    $("#minResponseTimeKO").append(stat.minResponseTime.ko);

    $("#maxResponseTime").append(stat.maxResponseTime.total);
    $("#maxResponseTimeOK").append(stat.maxResponseTime.ok);
    $("#maxResponseTimeKO").append(stat.maxResponseTime.ko);

    $("#meanResponseTime").append(stat.meanResponseTime.total);
    $("#meanResponseTimeOK").append(stat.meanResponseTime.ok);
    $("#meanResponseTimeKO").append(stat.meanResponseTime.ko);

    $("#standardDeviation").append(stat.standardDeviation.total);
    $("#standardDeviationOK").append(stat.standardDeviation.ok);
    $("#standardDeviationKO").append(stat.standardDeviation.ko);

    $("#percentiles1").append(stat.percentiles1.total);
    $("#percentiles1OK").append(stat.percentiles1.ok);
    $("#percentiles1KO").append(stat.percentiles1.ko);

    $("#percentiles2").append(stat.percentiles2.total);
    $("#percentiles2OK").append(stat.percentiles2.ok);
    $("#percentiles2KO").append(stat.percentiles2.ko);

    $("#percentiles3").append(stat.percentiles3.total);
    $("#percentiles3OK").append(stat.percentiles3.ok);
    $("#percentiles3KO").append(stat.percentiles3.ko);

    $("#percentiles4").append(stat.percentiles4.total);
    $("#percentiles4OK").append(stat.percentiles4.ok);
    $("#percentiles4KO").append(stat.percentiles4.ko);

    $("#meanNumberOfRequestsPerSecond").append(stat.meanNumberOfRequestsPerSecond.total);
    $("#meanNumberOfRequestsPerSecondOK").append(stat.meanNumberOfRequestsPerSecond.ok);
    $("#meanNumberOfRequestsPerSecondKO").append(stat.meanNumberOfRequestsPerSecond.ko);
}
