#set page(
  paper: "a4",
  margin: (
    top: 15mm,
    right: 20mm,
    bottom: 15mm,
    left: 20mm,
  ),
)

#set text(font: "NanumMyeongjo", size: 10pt)
#set par(justify: false, leading: 0.7em)
#show link: set text(fill: blue)
#show heading.where(level: 1): set text(size: 13pt, weight: "bold")
#show heading.where(level: 1): set block(above: 1.1em, below: 0.6em)

#let section-break() = v(0.9em)

#let info(label, value) = {
  strong(label + ": ")
  value
  parbreak()
}

#let experience(title, period, organization, body) = [
  #table(
    columns: (1fr, auto),
    stroke: none,
    inset: 0pt,
    column-gutter: 0.8em,
    align: (left, right),
    [*#title*],
    [#period],
  )
  #emph(organization)

  #v(0.4em)
  #body
]

#let education(title, period, organization, body) = [
  #table(
    columns: (1fr, auto),
    stroke: none,
    inset: 0pt,
    column-gutter: 0.8em,
    align: (left, right),
    [*#title*],
    [#period],
  )
  #emph(organization)

  #if body != [] [
    #v(0.4em)
    #body
  ]
]

#align(center)[
  #text(size: 22pt, weight: "bold")[장창서]
]

#v(-0.5em)

#align(center)[
  #text(size: 13pt, style: "italic")[DevOps Engineer]
]

#section-break()
#info([Email], [#link("mailto:beleap@beleap.dev")[beleap\@beleap.dev]])
#info([Phone], [010 9439 4941])
#info([GitHub], [#link("https://github.com/BeLeap")[BeLeap]])

= About Me

안녕하세요. DevOps Engineer 장창서입니다.

= Work Experience

#experience(
  [DevOps Engineer],
  [2024.03 - ],
  [Viva Republica],
  [
    주요 업무

    - On-Premise Kubernetes Cluster 운영
    - 내부 DevOps 시스템 개발
    - 내부 ZTNA 개발
  ],
)

#section-break()

#experience(
  [DevOps Engineer],
  [2022.08 - 2024.02],
  [Riiid],
  [
    주요 업무

    - ArgoCD Sync Unkown 에러 메시지 원인 분석 및 해결
    - Azure 초기 구조 설계 및 작업
    - Keycloak과 AssumeRole을 활용한 사용하기 편리한 multi-account AWS 인증 환경 구축
    - On-Premise GPU Kubernetes Cluster 운영
    - Santa Toeic, Airmath 신규 인프라 이전

    #v(0.6em)
    기술 스택

    - AWS, Azure
    - Kubernetes + Istio + Helm + ArgoCD
    - On-Premise GPU Kubernetes Cluster (Kubespray, Ansible)
    - Terraform
    - Datadog
  ],
)

#section-break()

#experience(
  [Brain/Dev],
  [2021.12 - 2022.08],
  [마인즈랩],
  [
    주요 업무

    - Java 언어를 사용하여 동기 방식으로 작성된 TTS 서버를 Kotlin 언어를 사용하여 비동기 방식으로 재작성

    #v(0.6em)
    기술 스택

    - Kotlin
    - Spring Boot
    - gRPC
  ],
)

#section-break()

#experience(
  [Software Engineer],
  [2021.10 - 2021.12],
  [Nearthlab],
  [
    주요 업무

    - 풍력발전기 점검 사진 배치 처리 기능 개발

    #v(0.6em)
    기술 스택

    - TypeScript
    - AWS Lambda
    - NestJS
    - Vercel
  ],
)

#section-break()

#experience(
  [Backend Engineer],
  [2021.06 - 2021.10],
  [Riiid],
  [
    주요 업무

    - RB2A(Airmath) 도메인 서버 개발

    #v(0.6em)
    기술 스택

    - Spring Boot
    - Kotlin
    - PostgreSQL
    - gRPC
  ],
)

= Side Project

#experience(
  [Backend],
  [2020.01 -],
  [KLUE],
  [
    KLUE 백엔드 서버 개발

    - Express
    - NestJS
    - TypeScript
    - AWS ECS
    - MariaDB

    #v(0.6em)
    참고: #link("https://klue.kr")[KLUE]는 고려대학교 학생들을 대상으로 서비스하고 있는 강의평가 공유 서비스입니다.
  ],
)

= Education

#education(
  [컴퓨터학과 학사],
  [2019.03 -],
  [고려대학교],
  [],
)
