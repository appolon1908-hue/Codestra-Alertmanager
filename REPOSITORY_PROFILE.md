# Repository Profile — `Codestra-Alertmanager`

## Identity

- **Repository:** `appolon1908-hue/Codestra-Alertmanager`
- **Category:** Observability backend — alert routing
- **Visibility:** `public`
- **Default branch:** `main`
- **Canonical hostname:** `aler.codestra.media`
- **Exposure:** Internal/private only; no public native UI or API
- **Authority:** Primary alert grouping, deduplication, inhibition, silence, maintenance, and governed notification-handoff authority

## Purpose

Receives Prometheus alerts, reduces noise, applies severity and ownership routing, and hands approved notifications to Middleware without bypassing communications policy.

## Owns

- Alert grouping, deduplication, inhibition, routing, silences, maintenance, watchdog, and recurring-alert policy
- Alert ownership labels and route trees
- Alertmanager configuration, validation, upgrade, rollback, and operational runbooks

## Does not own

- Direct provider credentials or delivery integrations that bypass Middleware
- Prometheus rule definitions
- Public access to the native Alertmanager listener

## Key integrations

- Prometheus
- Middleware-governed alert notification endpoint
- Grafana operational views
- Incident and communications runbooks

## Current priorities

1. Finalize central routing and inhibition rules
2. Prove route ownership, silence, maintenance, watchdog, and recurring-alert behavior
3. Keep direct email, SMS, voice, Slack, and PagerDuty integrations disabled unless separately approved
4. Add backup, restore, upgrade, and rollback evidence

## Governance and safety

- Promotion model: `feature/docs/fix/security/upgrade -> development -> test -> staging -> production -> main`.
- Native port `9093` must remain private; `aler.codestra.media` must not expose the native service publicly.
- Never commit webhook secrets, provider credentials, customer data, access tokens, or private keys.
- Notification delivery remains governed by Middleware and explicit activation gates.
- Merge does not start Alertmanager, send notifications, change routes live, expose ports, or deploy software.

## Account-wide catalog

See `appolon1908-hue/documentaions/REPOSITORY_CATALOG.md`.
