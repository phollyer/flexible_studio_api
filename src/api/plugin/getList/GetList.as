package api.plugin.getList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.plugin.getList.GetListEvent;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="GetListEvent")]
	[Event( name="result" , type="GetListEvent")]
	[Event( name="getListError" , type="PluginError")]
	[Event(name="result", type="api.events.plugin.getList.GetListEvent")]
	[Bindable]
	public class GetList extends Plugin
	{		
		// Result
		public var plugins:XML = null;
		
		public function GetList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getList():void
		{
			ssCore.Plugin.getList( {}
								  ,{callback:actionComplete, errorSTR:"getListError", code:"30002"} );
		}
		override protected function sendResult( r:Object ):void
		{
			plugins = XML( r.result );
			
			var e : GetListEvent = new GetListEvent( GetListEvent.RESULT );
			e.plugins = plugins;
			dispatchEvent( e );
		}
	}
}