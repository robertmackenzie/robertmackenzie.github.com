---
layout: page
title: About
permalink: /about/
---

Backend engineer and intrapreneur who values building top quality software with others using open source and social coding practices.

Hobbies & Side Projects
-----------------------

* Audio books (non-fiction and Sci-Fi/Fantasy)
* Squash
* [Homelab](https://www.reddit.com/r/homelab/). Currently a HP Gen8 Microserver.
  Thinking about some network hardware. Either something integrated like a Cisco
  890ISR or go mad with some Ubiquiti gear.
* [Oasis](https://github.com/robertmackenzie/oasis) - A service to create services via REST. This was written mainly to enjoy some Ruby. A colleague also asked me how I might refactor the domain model in [lashd/mirage](https://github.com/lashd/mirage) and this project is me thinking out loud.
* [Nand2Tetris](http://www.nand2tetris.org/) - Building a Modern Computer from First Principles. I've [finished part 1](https://github.com/robertmackenzie/nand2tetris), which is Chapters 1-6, which covers the hardware components.

Professional and Voluntary Achievements
---------------------------------------
*(by organisation, in approx. chronological order, most recent first)*

### Ovo Energy (6 month contract/current)

#### Greenfield data platform

* On the job software engineering training for former database engineers.
* Built a Kafka Connect based pipeline to migrate from SQL Server based data warehouse to Google BigQuery.
* Maintained Google Cloud and Kubernetes based infrastructure, with Prometheus/Grafana for monitoring and alerting.
* GDPR compliance work.

### BSkyB/Sky (5 years)

#### Real-time data platform

* Lead engineer building Sky’s strategic data collection library Sky Tags, bringing consistency to analytics and ad-tech integrations and enabling Sky to collect its own digital data.
* Built a real-time data pipeline, using Kafka, Spark, and Druid, to ingest, enrich, and make available data collected from Sky Tags and legacy data warehouses for self-service BI and recommendations.
* Built a customer segmentation service, using Scala and Akka, which provides boolean responses to customer and device segment membership queries and lists segments for a customer or device by id, using Kafka as a backing store. This has enabled specific targeting to customers with messaging and offers.
* Data modeling and schematization of Sky’s raw analytical data using Avro and a schema registry service, enabling a continuous delivery approach to managing data across Sky.
* Maintained on-prem hardware, including networks, using bespoke configuration management tooling and system administration.
* Composed an internal compute and object storage cloud by deploying Docker, Mesos, Marathon, Minio, and Spark, on top of on-prem hardware.
* Prototyped a hybrid cloud approach by extending the on-prem analytics pipeline to AWS.

#### Edge Services

* Migrated edge routing to a self-service model, saving vendor support costs, increasing developer autonomy, and enabling the re-launch of Sky.com.
* Implemented HTTPS across Sky.com.
* Substantial work on Akamai configuration.

#### Sky.com

* Re-platformed Sky.com from OpenCMS to polyglot micro-services. Examples of sites are https://contactus.sky.com, https://diagnostics.sky.com, https://www.sky.com.
* Built a channel masthead, which is the channel branded header and footer of Sky.com. Demo page: http://masthead.sky.com/demo/sky-atlantic.
* Built a continuous delivery pipeline with parallel end-to-end tests in every browser/device including visual regression testing using screenshot comparison.
* Worked extensively with Heroku and AWS services.

#### Sky Graduate Bootcamp

* Built a career management tool using Ruby on Rails.

### Bravo Fleet (5 years; voluntary role)

* Prototyped a new CMS using PHP and CodeIgnitor.
* Built a new landing site, with vBulletin RSS feeds integrated.
* Added several simple features to CMS, such as message of the day.
* Implemented a new look and feel to CMS.
* Managed infrastructure via cPanel and databases via phpMyAdmin.
