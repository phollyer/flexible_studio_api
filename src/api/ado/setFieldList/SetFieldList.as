package api.ado.setFieldList
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Bindable]
	public class SetFieldList extends Ado
	{
		// Optional
		public var fieldList:Array = null;
		
		public function SetFieldList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setFieldList():void
		{
			switch( fieldList.length > 0 )
			{
				case false:
					ssCore.Ado.setFieldList( {}
											,{callback:actionComplete, errorSTR:"setFieldListError", code:"16020"} );
					break;
				case true:
					var __s:String = fieldList.join( "," );
					ssCore.Ado.setFieldList( {fieldList:__s}
											,{callback:actionComplete, errorSTR:"setFieldListError", code:"16020"} );
			}
		}
	}
}