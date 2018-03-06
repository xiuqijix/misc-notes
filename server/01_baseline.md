# Run upstream Chromium reference testing baseline data in every milestone

1. cd /data/xiuqi/yugang/web_qa-testkit-ci

2. Update ./tests/manifest_json/manifest1.json and ./tests/manifest_json/manifest0.json to lastest version.

3. Set up the web-testing-service site through wifi.

4. export http_proxy="" && export https_proxy=""

5. Set up chrome on android devices. eg: ASUS_Memo_Pad_8

6. ./testkit-ci JSON -m ./tests/manifest_json/manifest1.json -o /tmp/result.json -s ./tests/manifest_json/manifest0.json -p android --wts-url http://192.168.1.102 --case-type testharness --wd-launcher chromedriver -l chromium

7. Add
"test_env":{"baseline_desc":"Chrome Beta 51.0.2704.77 on Android 4.4.2"},
to result.json

8. git push the result to https://github.com/crosswalk-project/crosswalk-test-results/tree/gh-pages.
