# runtime-button
runtime研究

---

作为示例：解决button连续点击，事件重复&冲突的问题。平滑UIView的animate动画

-----

为什么是UIControl的category

因为button的target-event模式，点击事件是通过调用方法sendAction:to:forEvent:来实现的

而方法sendAction:to:forEvent:就是UIControl的实例方法，根据最小公约数原则，我们需要选择需要添加category的UI控件为UIControl