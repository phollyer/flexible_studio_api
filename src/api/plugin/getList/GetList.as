package api.plugin.getList
{
	import api.events.plugin.getList.GetListEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="GetListEvent")]
	[Event( name="result" , type="GetListEvent")]
	[Event( name="getListError" , type="PluginError")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.plugin.getList.GetListEvent.RESULT
	*/
	[Event(name="result", type="api.events.plugin.getList.GetListEvent")]
	[Bindable]
	/**
	* Returns a list of all currently loaded plugin instances in XML format
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getList.html Northcode Help Documentation
	*/
	public class GetList extends Plugin
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var plugins:XML = null;
		
		/**
		* Constructor for Plugin.GetList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getList.html Northcode Help Documentation
		*/
		public function GetList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns a list of all currently loaded plugin instances in XML format
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getList.html Northcode Help Documentation
		*/
		public function getList():void
		{
			ssCore.Plugin.getList( {}
								  ,{callback:actionComplete, errorSTR:"getListError", code:"30002"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			plugins = XML( r.result );
			
			var e : GetListEvent = new GetListEvent( GetListEvent.RESULT );
			e.plugins = plugins;
			dispatchEvent( e );
		}
	}
}