package api.ado.setDelimiter
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Bindable]
	public class SetDelimiter extends Ado
	{
		// Optional
		public var delimiter:String = "|";
		
		public function SetDelimiter(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setDelimiter():void
		{
			ssCore.Ado.setDelimiter( {delimiter:delimiter}
									,{callback:actionComplete, errorSTR:"setDelimiterError", code:"16019"} );
		}
	}
}