//
//  StatusBarController.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import AppKit
import SwiftUI

class StatusBarController: ObservableObject {
    private var statusBar: NSStatusBar?
    private var statusItem: NSStatusItem?
    private var popover: NSPopover?
    private var eventMonitor: EventMonitor?

    init() {
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown], handler: mouseEventHandler)
    }

    func start(with popover: NSPopover) {
        if let popover = self.popover {
            popover.close()
        }

        self.popover = popover

        setupStatusBar(with: popover)
    }

    @objc private func togglePopover(sender: AnyObject) {
        if let popover = popover {
            if popover.isShown {
                hidePopover(sender)
            } else {
                showPopover(sender)
            }
        }
    }

    private func showPopover(_: AnyObject) {
        if let statusBarButton = statusItem?.button, let popover = popover {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
            NSApp.activate(ignoringOtherApps: true)
            eventMonitor?.start()
        }
    }

    private func hidePopover(_ sender: AnyObject) {
        popover?.performClose(sender)
        eventMonitor?.stop()
    }

    private func mouseEventHandler(_ event: NSEvent?) {
        if let popover = popover {
            if popover.isShown, let event = event {
                hidePopover(event)
            }
        }
    }

    private func setupStatusBar(with _: NSPopover) {
        guard statusBar == nil else { return }

        let statusBar = NSStatusBar()
        statusItem = statusBar.statusItem(withLength: 28.0)

        if let statusBarButton = statusItem?.button {
            statusBarButton.image = NSImage(systemSymbolName: "list.star", accessibilityDescription: "Medo Menubar Icon")
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true

            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }

        self.statusBar = statusBar
    }
}
