package com.jxjxgo.scrooge.thrift.template

import javax.inject.{Inject, Named}

import com.twitter.finagle.{ListeningServer, Thrift}
import com.twitter.scrooge.ThriftService
import com.twitter.util.Await

/**
  * Created by fangzhongwei on 2017/1/28.
  */

trait ScroogeThriftServerTemplate {
  def init: Unit
}

class ScroogeThriftServerTemplateImpl @Inject()(@Named("finagle.thrift.host.port")
                                                host: String, thriftService: ThriftService) extends ScroogeThriftServerTemplate {
  private[this] var server: ListeningServer = _

  override def init: Unit = {
    server = Thrift.server.serveIface(host, thriftService)
    Await.ready(server)
  }
}
