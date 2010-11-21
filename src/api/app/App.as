package api.app
{
	import api.Kernel;
	
	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App.html Northcode Help Documentation
	*/
	public class App extends Kernel
	{
		public static const ON_DATA : String = "onData";
		public static const ON_DESKTOP_CHANGE : String = "onDesktopChange";
		public static const ON_DEVICE_CHANGE : String = "onDeviceChange";
		public static const ON_DIALOG :String = "onDialog";
		public static const ON_DRAG_DROP : String = "onDragDrop";
		public static const ON_EXIT_WINDOWS : String = "onExitWindows";
		public static const ON_OTHER_INSTANCE : String = "onOtherInstance";
		public static const ON_QUIT : String = "onQuit";
		public static const ON_SYS_COLOR_CHANGE : String = "onSysColorChange";
		public static const ON_WINDOW : String = "onWindow";
		
		/**
		* Constructor for App()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App.html Northcode Help Documentation
		*/
		public function App(target:IEventDispatcher=null)
		{
			super(target);
		}		

		/**
		* This method should be called when a SWF Studio action
		* has completed successfully.
		*
		* <p>This method should be overridden by sub classes in
		* order to dispatch Class specific data</p>
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult(r:Object):void
		{
		}
	}
}