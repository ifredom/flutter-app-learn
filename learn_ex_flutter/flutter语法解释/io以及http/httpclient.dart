import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _loading = false;
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('获取百度首页'),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = '正在请求';
                      });
                      var url = Uri.parse('https://www.baidu.com');
                      try {
                        //创建一个HttpClient
                        HttpClient httpClient = new HttpClient();
                        //打开Http连接
                        HttpClientRequest request =
                            await httpClient.getUrl(url);
                        //使用iPhone的UA
                        request.headers.add("user-agent",
                            "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                        //等待连接服务器（会将请求信息发送给服务器）
                        HttpClientResponse response = await request.close();
                        //读取响应内容
                        _text = await response.transform(utf8.decoder).join();
                        //输出响应头
                        print(response.headers);
                        //关闭client后，通过该client发起的所有请求都会中止。
                        httpClient.close();
                      } catch (e) {
                        _text = "请求失败：$e";
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
            ),
            Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")))
          ],
        ),
      ),
    );
  }
}
