package api.registry
{
	import flash.events.IEventDispatcher;
	
	import api.Kernel;

	public class Registry extends Kernel
	{
		// Root Keys
		public static const HKEY_CLASSES_ROOT:String = "HKEY_CLASSES_ROOT";
		public static const HKEY_CURRENT_USER:String = "HKEY_CURRENT_USER";
		public static const HKEY_USERS:String = "HKEY_USERS";
		public static const HKEY_LOCAL_MACHINE:String = "HKEY_LOCAL_MACHINE";
		public static const HKEY_PERFORMANCE_DATA:String = "HKEY_PERFORMANCE_DATA";
		public static const HKEY_CURRENT_CONFIG:String = "HKEY_CURRENT_CONFIG";
		public static const HKEY_DYN_DATA:String = "HKEY_DYN_DATA";
		
		public function Registry(target:IEventDispatcher=null)
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