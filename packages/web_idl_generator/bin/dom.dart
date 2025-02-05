// Generated by Rampage on 2025-02-04 19:37:30.879703

import 'dart:js_interop';

extension type EventInit._(JSObject _) implements JSObject {
  external factory EventInit({bool bubbles, bool cancelable, bool composed});

  external bool get bubbles;
  external set bubbles(bool value);
  external bool get cancelable;
  external set cancelable(bool value);
  external bool get composed;
  external set composed(bool value);
}
extension type CustomEventInit._(JSObject _) implements JSObject, EventInit {
  external factory CustomEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    JSAny detail,
  });

  external JSAny get detail;
  external set detail(JSAny value);
}
extension type EventListenerOptions._(JSObject _) implements JSObject {
  external factory EventListenerOptions({bool capture});

  external bool get capture;
  external set capture(bool value);
}
extension type AddEventListenerOptions._(JSObject _)
    implements JSObject, EventListenerOptions {
  external factory AddEventListenerOptions({
    bool capture,
    bool passive,
    bool once,
    AbortSignal signal,
  });

  external bool get passive;
  external set passive(bool value);
  external bool get once;
  external set once(bool value);
  external AbortSignal get signal;
  external set signal(AbortSignal value);
}
extension type MutationObserverInit._(JSObject _) implements JSObject {
  external factory MutationObserverInit({
    bool childList,
    bool attributes,
    bool characterData,
    bool subtree,
    bool attributeOldValue,
    bool characterDataOldValue,
    JSArray<JSString> attributeFilter,
  });

  external bool get childList;
  external set childList(bool value);
  external bool get attributes;
  external set attributes(bool value);
  external bool get characterData;
  external set characterData(bool value);
  external bool get subtree;
  external set subtree(bool value);
  external bool get attributeOldValue;
  external set attributeOldValue(bool value);
  external bool get characterDataOldValue;
  external set characterDataOldValue(bool value);
  external JSArray<JSString> get attributeFilter;
  external set attributeFilter(JSArray<JSString> value);
}
extension type GetRootNodeOptions._(JSObject _) implements JSObject {
  external factory GetRootNodeOptions({bool composed});

  external bool get composed;
  external set composed(bool value);
}
extension type ShadowRootInit._(JSObject _) implements JSObject {
  external factory ShadowRootInit({
    ShadowRootMode mode,
    bool delegatesFocus,
    SlotAssignmentMode slotAssignment,
    bool clonable,
    bool serializable,
  });

  external ShadowRootMode get mode;
  external set mode(ShadowRootMode value);
  external bool get delegatesFocus;
  external set delegatesFocus(bool value);
  external SlotAssignmentMode get slotAssignment;
  external set slotAssignment(SlotAssignmentMode value);
  external bool get clonable;
  external set clonable(bool value);
  external bool get serializable;
  external set serializable(bool value);
}
extension type StaticRangeInit._(JSObject _) implements JSObject {
  external factory StaticRangeInit({
    Node startContainer,
    int startOffset,
    Node endContainer,
    int endOffset,
  });

  external Node get startContainer;
  external set startContainer(Node value);
  external int get startOffset;
  external set startOffset(int value);
  external Node get endContainer;
  external set endContainer(Node value);
  external int get endOffset;
  external set endOffset(int value);
}
typedef ShadowRootMode = String;
typedef SlotAssignmentMode = String;
typedef EventHandlerNonNull = JSFunction;
typedef MutationCallback = JSFunction;
extension type Performance._(JSObject _) implements JSObject, EventTarget {
  external DOMHighResTimeStamp get timeOrigin;
  external DOMHighResTimeStamp now();
  external JSObject toJSON();
}
extension type Event._(JSObject _) implements JSObject {
  external factory Event(String type, [EventInit eventInitDict]);

  external String get type;
  external EventTarget? get target;
  external EventTarget? get srcElement;
  external EventTarget? get currentTarget;
  external int get eventPhase;
  external bool get cancelBubble;
  external set cancelBubble(bool value);
  external bool get bubbles;
  external bool get cancelable;
  external bool get returnValue;
  external set returnValue(bool value);
  external bool get defaultPrevented;
  external bool get composed;
  external bool get isTrusted;
  external DOMHighResTimeStamp get timeStamp;
  external JSArray<EventTarget> composedPath();
  external void stopPropagation();
  external void stopImmediatePropagation();
  external void preventDefault();
  external void initEvent(String type, [bool bubbles, bool cancelable]);
}
extension type CustomEvent._(JSObject _) implements JSObject, Event {
  external factory CustomEvent(String type, [CustomEventInit eventInitDict]);

  external JSAny get detail;
  external void initCustomEvent(
    String type, [
    bool bubbles,
    bool cancelable,
    JSAny detail,
  ]);
}
extension type EventTarget._(JSObject _) implements JSObject {
  external factory EventTarget();

  external void addEventListener(
    String type,
    EventListener? callback, [
    JSAny options,
  ]);
  external void removeEventListener(
    String type,
    EventListener? callback, [
    JSAny options,
  ]);
  external bool dispatchEvent(Event event);
}
extension type EventListener._(JSObject _) implements JSObject {
  external void handleEvent(Event event);
}
extension type AbortController._(JSObject _) implements JSObject {
  external factory AbortController();

  external AbortSignal get signal;
  external void abort([JSAny reason]);
}
extension type AbortSignal._(JSObject _) implements JSObject, EventTarget {
  external bool get aborted;
  external JSAny get reason;
  external EventHandler get onabort;
  external set onabort(EventHandler value);
  external AbortSignal abort([JSAny reason]);
  external AbortSignal timeout(int milliseconds);
  external AbortSignal _any(JSArray<AbortSignal> signals);
  external void throwIfAborted();
}
extension type NonElementParentNode._(JSObject _) implements JSObject {
  external Element? getElementById(String elementId);
}
extension type DocumentOrShadowRoot._(JSObject _) implements JSObject {}
extension type ParentNode._(JSObject _) implements JSObject {
  external HTMLCollection get children;
  external Element? get firstElementChild;
  external Element? get lastElementChild;
  external int get childElementCount;
  external void prepend(JSAny nodes);
  external void append(JSAny nodes);
  external void replaceChildren(JSAny nodes);
  external Element? querySelector(String selectors);
  external NodeList querySelectorAll(String selectors);
}
extension type NonDocumentTypeChildNode._(JSObject _) implements JSObject {
  external Element? get previousElementSibling;
  external Element? get nextElementSibling;
}
extension type ChildNode._(JSObject _) implements JSObject {
  external void before(JSAny nodes);
  external void after(JSAny nodes);
  external void replaceWith(JSAny nodes);
  external void remove();
}
extension type Slottable._(JSObject _) implements JSObject {
  external HTMLSlotElement? get assignedSlot;
}
extension type NodeList._(JSObject _) implements JSObject {
  external int get length;
  external Node? item(int index);
}
extension type HTMLCollection._(JSObject _) implements JSObject {
  external int get length;
  external Element? item(int index);
  external Element? namedItem(String name);
}
extension type MutationObserver._(JSObject _) implements JSObject {
  external factory MutationObserver(MutationCallback callback);

  external void observe(Node target, [MutationObserverInit options]);
  external void disconnect();
  external JSArray<MutationRecord> takeRecords();
}
extension type MutationRecord._(JSObject _) implements JSObject {
  external String get type;
  external Node get target;
  external NodeList get addedNodes;
  external NodeList get removedNodes;
  external Node? get previousSibling;
  external Node? get nextSibling;
  external String? get attributeName;
  external String? get attributeNamespace;
  external String? get oldValue;
}
extension type Node._(JSObject _) implements JSObject, EventTarget {
  external int get nodeType;
  external String get nodeName;
  external String get baseURI;
  external bool get isConnected;
  external Document? get ownerDocument;
  external Node? get parentNode;
  external Element? get parentElement;
  external NodeList get childNodes;
  external Node? get firstChild;
  external Node? get lastChild;
  external Node? get previousSibling;
  external Node? get nextSibling;
  external String? get nodeValue;
  external set nodeValue(String? value);
  external String? get textContent;
  external set textContent(String? value);
  external Node getRootNode([GetRootNodeOptions options]);
  external bool hasChildNodes();
  external void normalize();
  external Node cloneNode([bool subtree]);
  external bool isEqualNode(Node? otherNode);
  external bool isSameNode(Node? otherNode);
  external int compareDocumentPosition(Node other);
  external bool contains(Node? other);
  external String? lookupPrefix(String? namespace);
  external String? lookupNamespaceURI(String? prefix);
  external bool isDefaultNamespace(String? namespace);
  external Node insertBefore(Node node, Node? child);
  external Node appendChild(Node node);
  external Node replaceChild(Node node, Node child);
  external Node removeChild(Node child);
}
extension type Document._(JSObject _)
    implements
        JSObject,
        Node,
        NonElementParentNode,
        DocumentOrShadowRoot,
        ParentNode,
        XPathEvaluatorBase {
  external factory Document();

  external DOMImplementation get implementation;
  external String get URL;
  external String get documentURI;
  external String get compatMode;
  external String get characterSet;
  external String get charset;
  external String get inputEncoding;
  external String get contentType;
  external DocumentType? get doctype;
  external Element? get documentElement;
  external HTMLCollection getElementsByTagName(String qualifiedName);
  external HTMLCollection getElementsByTagNameNS(
    String? namespace,
    String localName,
  );
  external HTMLCollection getElementsByClassName(String classNames);
  external Element createElement(String localName, [JSAny options]);
  external Element createElementNS(
    String? namespace,
    String qualifiedName, [
    JSAny options,
  ]);
  external DocumentFragment createDocumentFragment();
  external Text createTextNode(String data);
  external CDATASection createCDATASection(String data);
  external Comment createComment(String data);
  external ProcessingInstruction createProcessingInstruction(
    String target,
    String data,
  );
  external Node importNode(Node node, [bool subtree]);
  external Node adoptNode(Node node);
  external Attr createAttribute(String localName);
  external Attr createAttributeNS(String? namespace, String qualifiedName);
  external Event createEvent(String interface);
  external Range createRange();
  external NodeIterator createNodeIterator(
    Node root, [
    int whatToShow,
    NodeFilter? filter,
  ]);
  external TreeWalker createTreeWalker(
    Node root, [
    int whatToShow,
    NodeFilter? filter,
  ]);
}
extension type XMLDocument._(JSObject _) implements JSObject, Document {}
extension type DOMImplementation._(JSObject _) implements JSObject {
  external DocumentType createDocumentType(
    String qualifiedName,
    String publicId,
    String systemId,
  );
  external XMLDocument createDocument(
    String? namespace,
    String qualifiedName, [
    DocumentType? doctype,
  ]);
  external Document createHTMLDocument([String title]);
  external bool hasFeature();
}
extension type DocumentType._(JSObject _) implements JSObject, Node, ChildNode {
  external String get name;
  external String get publicId;
  external String get systemId;
}
extension type DocumentFragment._(JSObject _)
    implements JSObject, Node, NonElementParentNode, ParentNode {
  external factory DocumentFragment();
}
extension type ShadowRoot._(JSObject _)
    implements JSObject, DocumentFragment, DocumentOrShadowRoot {
  external ShadowRootMode get mode;
  external bool get delegatesFocus;
  external SlotAssignmentMode get slotAssignment;
  external bool get clonable;
  external bool get serializable;
  external Element get host;
  external EventHandler get onslotchange;
  external set onslotchange(EventHandler value);
}
extension type Element._(JSObject _)
    implements
        JSObject,
        Node,
        ParentNode,
        NonDocumentTypeChildNode,
        ChildNode,
        Slottable {
  external String? get namespaceURI;
  external String? get prefix;
  external String get localName;
  external String get tagName;
  external String get id;
  external set id(String value);
  external String get className;
  external set className(String value);
  external DOMTokenList get classList;
  external String get slot;
  external set slot(String value);
  external NamedNodeMap get attributes;
  external ShadowRoot? get shadowRoot;
  external bool hasAttributes();
  external JSArray<JSString> getAttributeNames();
  external String? getAttribute(String qualifiedName);
  external String? getAttributeNS(String? namespace, String localName);
  external void setAttribute(String qualifiedName, String value);
  external void setAttributeNS(
    String? namespace,
    String qualifiedName,
    String value,
  );
  external void removeAttribute(String qualifiedName);
  external void removeAttributeNS(String? namespace, String localName);
  external bool toggleAttribute(String qualifiedName, [bool force]);
  external bool hasAttribute(String qualifiedName);
  external bool hasAttributeNS(String? namespace, String localName);
  external Attr? getAttributeNode(String qualifiedName);
  external Attr? getAttributeNodeNS(String? namespace, String localName);
  external Attr? setAttributeNode(Attr attr);
  external Attr? setAttributeNodeNS(Attr attr);
  external Attr removeAttributeNode(Attr attr);
  external ShadowRoot attachShadow(ShadowRootInit init);
  external Element? closest(String selectors);
  external bool matches(String selectors);
  external bool webkitMatchesSelector(String selectors);
  external HTMLCollection getElementsByTagName(String qualifiedName);
  external HTMLCollection getElementsByTagNameNS(
    String? namespace,
    String localName,
  );
  external HTMLCollection getElementsByClassName(String classNames);
  external Element? insertAdjacentElement(String where, Element element);
  external void insertAdjacentText(String where, String data);
}
extension type NamedNodeMap._(JSObject _) implements JSObject {
  external int get length;
  external Attr? item(int index);
  external Attr? getNamedItem(String qualifiedName);
  external Attr? getNamedItemNS(String? namespace, String localName);
  external Attr? setNamedItem(Attr attr);
  external Attr? setNamedItemNS(Attr attr);
  external Attr removeNamedItem(String qualifiedName);
  external Attr removeNamedItemNS(String? namespace, String localName);
}
extension type Attr._(JSObject _) implements JSObject, Node {
  external String? get namespaceURI;
  external String? get prefix;
  external String get localName;
  external String get name;
  external String get value;
  external set value(String value);
  external Element? get ownerElement;
  external bool get specified;
}
extension type CharacterData._(JSObject _)
    implements JSObject, Node, NonDocumentTypeChildNode, ChildNode {
  external String get data;
  external set data(String value);
  external int get length;
  external String substringData(int offset, int count);
  external void appendData(String data);
  external void insertData(int offset, String data);
  external void deleteData(int offset, int count);
  external void replaceData(int offset, int count, String data);
}
extension type Text._(JSObject _)
    implements JSObject, CharacterData, Slottable {
  external factory Text([String data]);

  external String get wholeText;
  external Text splitText(int offset);
}
extension type CDATASection._(JSObject _) implements JSObject, Text {}
extension type ProcessingInstruction._(JSObject _)
    implements JSObject, CharacterData {
  external String get target;
}
extension type Comment._(JSObject _) implements JSObject, CharacterData {
  external factory Comment([String data]);
}
extension type AbstractRange._(JSObject _) implements JSObject {
  external Node get startContainer;
  external int get startOffset;
  external Node get endContainer;
  external int get endOffset;
  external bool get collapsed;
}
extension type StaticRange._(JSObject _) implements JSObject, AbstractRange {
  external factory StaticRange(StaticRangeInit init);
}
extension type Range._(JSObject _) implements JSObject, AbstractRange {
  external factory Range();

  external Node get commonAncestorContainer;
  external String get stringifier;
  external set stringifier(String value);
  external void setStart(Node node, int offset);
  external void setEnd(Node node, int offset);
  external void setStartBefore(Node node);
  external void setStartAfter(Node node);
  external void setEndBefore(Node node);
  external void setEndAfter(Node node);
  external void collapse([bool toStart]);
  external void selectNode(Node node);
  external void selectNodeContents(Node node);
  external int compareBoundaryPoints(int how, Range sourceRange);
  external void deleteContents();
  external DocumentFragment extractContents();
  external DocumentFragment cloneContents();
  external void insertNode(Node node);
  external void surroundContents(Node newParent);
  external Range cloneRange();
  external void detach();
  external bool isPointInRange(Node node, int offset);
  external int comparePoint(Node node, int offset);
  external bool intersectsNode(Node node);
}
extension type NodeIterator._(JSObject _) implements JSObject {
  external Node get root;
  external Node get referenceNode;
  external bool get pointerBeforeReferenceNode;
  external int get whatToShow;
  external NodeFilter? get filter;
  external Node? nextNode();
  external Node? previousNode();
  external void detach();
}
extension type TreeWalker._(JSObject _) implements JSObject {
  external Node get root;
  external int get whatToShow;
  external NodeFilter? get filter;
  external Node get currentNode;
  external set currentNode(Node value);
  external Node? parentNode();
  external Node? firstChild();
  external Node? lastChild();
  external Node? previousSibling();
  external Node? nextSibling();
  external Node? previousNode();
  external Node? nextNode();
}
extension type NodeFilter._(JSObject _) implements JSObject {
  external int acceptNode(Node node);
}
extension type DOMTokenList._(JSObject _) implements JSObject {
  external int get length;
  external String get value;
  external set value(String value);
  external String? item(int index);
  external bool contains(String token);
  external void add(String tokens);
  external void remove(String tokens);
  external bool toggle(String token, [bool force]);
  external bool replace(String token, String newToken);
  external bool supports(String token);
}
extension type XPathResult._(JSObject _) implements JSObject {
  external int get resultType;
  external double get numberValue;
  external String get stringValue;
  external bool get booleanValue;
  external Node? get singleNodeValue;
  external bool get invalidIteratorState;
  external int get snapshotLength;
  external Node? iterateNext();
  external Node? snapshotItem(int index);
}
extension type XPathExpression._(JSObject _) implements JSObject {
  external XPathResult evaluate(
    Node contextNode, [
    int type,
    XPathResult? result,
  ]);
}
extension type XPathNSResolver._(JSObject _) implements JSObject {
  external String? lookupNamespaceURI(String? prefix);
}
extension type XPathEvaluatorBase._(JSObject _) implements JSObject {
  external XPathExpression createExpression(
    String expression, [
    XPathNSResolver? resolver,
  ]);
  external Node createNSResolver(Node nodeResolver);
  external XPathResult evaluate(
    String expression,
    Node contextNode, [
    XPathNSResolver? resolver,
    int type,
    XPathResult? result,
  ]);
}
extension type XPathEvaluator._(JSObject _)
    implements JSObject, XPathEvaluatorBase {
  external factory XPathEvaluator();
}
extension type XSLTProcessor._(JSObject _) implements JSObject {
  external factory XSLTProcessor();

  external void importStylesheet(Node style);
  external DocumentFragment transformToFragment(Node source, Document output);
  external Document transformToDocument(Node source);
  external void setParameter(
    String namespaceURI,
    String localName,
    JSAny value,
  );
  external JSAny getParameter(String namespaceURI, String localName);
  external void removeParameter(String namespaceURI, String localName);
  external void clearParameters();
  external void reset();
}
typedef DOMHighResTimeStamp = double;
typedef EpochTimeStamp = int;
typedef EventHandler = EventHandlerNonNull?;

